use buku_murah

db.buku.insertMany([
  {
    judul: "Laskar Pelangi",
    penulis: "Andrea Hirata",
    tahun_terbit: 2005,
    harga: 80000
  },
  {
    judul: "Negeri 5 Menara",
    penulis: "Ahmad Fuadi",
    tahun_terbit: 2009,
    harga: 78000
  },
  {
    judul: "Filosofi Teras",
    penulis: "Henry Manampiring",
    tahun_terbit: 2018,
    harga: 99000
  },
  {
    judul: "Bumi Manusia",
    penulis: "Pramoedya Ananta Toer",
    tahun_terbit: 1980,
    harga: 55000
  },
  {
    judul: "Koala Kumal",
    penulis: "Raditya Dika",
    tahun_terbit: 2015,
    harga: 50000
  }
])

  
db.buku.updateOne(
  { judul: "Koala Kumal" },
  { $set: { harga: 58500 } }
)


db.buku.deleteMany(
  { harga: { $lt: 70000 } }
)


db.buku.aggregate([
  {
    $group: {
      _id: "$tahun",
      rata_rata_harga: { $avg: "$harga" }
    }
  }
])


db.buku.aggregate([
  {
    $group: {
      _id: "$tahun",
      jumlah_buku: { $sum: 1 }
    }
  }
])


db.buku.aggregate([
  {
    $group: {
      _id: "$penulis",
      jumlah_buku: { $sum: 1 },
      rata_rata_harga: { $avg: "$harga" }
    }
  },
  {
    $sort: { jumlah_buku: -1 }
  }
])
