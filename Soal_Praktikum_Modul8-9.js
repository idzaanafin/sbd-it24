use WarungPakBudi-5027241017;

db.produk.insertMany([
  {
    nama_produk: "Indomie Goreng Spesial",
    kategori: "Makanan Instan",
    harga_beli: 2500,
    harga_jual: 3000,
    stok: 100,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-05-01T00:00:00Z")
  },
  {
    nama_produk: "Sabun Mandi Lifebuoy Total 10",
    kategori: "Perawatan Diri",
    harga_beli: 3000,
    harga_jual: 4000,
    stok: 75,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-05-01T00:00:00Z")
  },
  {
    nama_produk: "Kopi Kapal Api Special Mix",
    kategori: "Minuman",
    harga_beli: 1000,
    harga_jual: 1500,
    stok: 200,
    satuan: "sachet",
    tanggal_masuk: ISODate("2025-04-20T00:00:00Z")
  },
  {
    nama_produk: "Beras Rojolele Super",
    kategori: "Bahan Pokok",
    harga_beli: 60000,
    harga_jual: 65000,
    stok: 30,
    satuan: "karung 5kg",
    tanggal_masuk: ISODate("2025-05-10T00:00:00Z")
  },
  {
    nama_produk: "Susu UHT Cokelat 250ml",
    kategori: "Minuman",
    harga_beli: 4500,
    harga_jual: 5500,
    stok: 8,
    satuan: "kotak",
    tanggal_masuk: ISODate("2025-05-15T00:00:00Z")
  },
  {
    nama_produk: "Deterjen Bubuk Attack",
    kategori: "Perlengkapan Rumah",
    harga_beli: 15000,
    harga_jual: 17500,
    stok: 40,
    satuan: "pack 800gr",
    tanggal_masuk: ISODate("2025-04-25T00:00:00Z")
  },
  {
    nama_produk: "Permen X",
    kategori: "Camilan",
    harga_beli: 500,
    harga_jual: 1000,
    stok: 3,
    satuan: "pcs",
    tanggal_masuk: ISODate("2025-03-01T00:00:00Z")
  }
]);

db.pelanggan.insertMany([
  {
    nama_pelanggan: "Siti Aminah",
    nomor_telepon: "081234567890",
    alamat: "Jl. Merpati No. 1, Surabaya",
    poin_loyalitas: 50,
    tanggal_bergabung: ISODate("2023-11-15T00:00:00Z")
  },
  {
    nama_pelanggan: "Budi Hartono",
    nomor_telepon: "087654321098",
    alamat: "Jl. Elang No. 22, Surabaya",
    poin_loyalitas: 120,
    tanggal_bergabung: ISODate("2024-01-20T00:00:00Z")
  },
  {
    nama_pelanggan: "Retno Wulandari",
    nomor_telepon: "085550001111",
    alamat: "Jl. Kenari Indah Blok C3, Sidoarjo",
    poin_loyalitas: 75,
    tanggal_bergabung: ISODate("2024-03-01T00:00:00Z")
  }
]);

db.transaksi.insertMany([
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-20T17:00:00Z"),
    nama_produk: "Indomie Goreng Spesial",
    harga: 3000,
    jumlah: 5,
    total: 30000,
    metode_pembayaran: "Tunai",
    status: "Selesai"
  },
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-20T17:00:00Z"),
    nama_produk: "Kopi Kapal Api Special Mix",
    harga: 1500,
    jumlah: 10,
    total: 30000,
    metode_pembayaran: "Tunai",
    status: "Selesai"
  },
  {
    nama_pelanggan: "Budi Hartono",
    tanggal_transaksi: ISODate("2025-05-21T21:30:00Z"),
    nama_produk: "Beras Rojolele Super",
    harga: 65000,
    jumlah: 1,
    total: 73000,
    metode_pembayaran: "QRIS",
    status: "Selesai"
  },
  {
    nama_pelanggan: "Budi Hartono",
    tanggal_transaksi: ISODate("2025-05-21T21:30:00Z"),
    nama_produk: "Sabun Mandi Lifebuoy Total 10",
    harga: 4000,
    jumlah: 2,
    total: 73000,
    metode_pembayaran: "QRIS",
    status: "Selesai"
  },
  {
    nama_pelanggan: "Siti Aminah",
    tanggal_transaksi: ISODate("2025-05-22T16:15:00Z"),
    nama_produk: "Susu UHT Cokelat 250ml",
    harga: 5500,
    jumlah: 4,
    total: 22000,
    metode_pembayaran: "Debit",
    status: "Selesai"
  },
  {
    nama_pelanggan: null,
    tanggal_transaksi: ISODate("2025-05-22T18:00:00Z"),
    nama_produk: "Indomie Goreng Spesial",
    harga: 3000,
    jumlah: 2,
    total: 6000,
    metode_pembayaran: "Tunai",
    status: "Selesai"
  },
  {
    nama_pelanggan: "Retno Wulandari",
    tanggal_transaksi: ISODate("2022-12-01T23:45:00Z"),
    nama_produk: "Permen X",
    harga: 1000,
    jumlah: 10,
    total: 10000,
    metode_pembayaran: "Tunai",
    status: "Selesai"
  }
]);




db.produk.find({
  kategori: "Minuman",
  stok: { $lt: 10 }
});


db.pelanggan.find({
  nama_pelanggan: "Siti Aminah"
});


db.transaksi.aggregate([
  {
    $match: {
      tanggal_transaksi: {
        $gte: ISODate("2025-05-22T00:00:00Z"),
        $lt: ISODate("2025-05-23T00:00:00Z")
      }
    }
  },
  {
    $group: {
      _id: "$tanggal_transaksi",
      total_belanja: { $sum: "$total" },
      metode_pembayaran: { $first: "$metode_pembayaran" }
    }
  }
]);


db.produk.distinct("kategori");


db.pelanggan.countDocuments();


db.produk.updateOne(
  { nama_produk: "Indomie Goreng Spesial" },
  {
    $inc: { stok: 50 },
    $set: { harga_beli: 2800 }
  }
);



db.pelanggan.updateMany(
  { tanggal_bergabung: { $lt: ISODate("2024-01-01T00:00:00Z") } },
  { $inc: { poin_loyalitas: 10 } }
);



db.pelanggan.updateOne(
  { nama_pelanggan: "Budi Hartono" },
  { $set: { alamat: "Jl. Cendrawasih No. 5, Gresik" } }
);


db.produk.deleteOne({
  nama_produk: "Permen X"
});


db.transaksi.deleteMany({
  metode_pembayaran: "Tunai",
  tanggal_transaksi: { $lt: ISODate("2023-01-01T00:00:00Z") }
});


db.transaksi.aggregate([
  {
    $group: {
      _id: "$metode_pembayaran",
      total_pendapatan: { $sum: "$total" }
    }
  },
  { $sort: { total_pendapatan: -1 } }
]);



db.transaksi.aggregate([
  { $match: { nama_pelanggan: { $ne: null } } },
  { $group: {
    _id: "$nama_pelanggan",
    jumlah_transaksi: { $sum: 1 }
  }},
  { $sort: { jumlah_transaksi: -1 } },
  { $limit: 3 }
]);


db.produk.find({
  stok: { $lt: 5 }
}).sort({ stok: 1 }).project({
  nama_produk: 1,
  kategori: 1,
  stok: 1
});

