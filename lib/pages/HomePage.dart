import 'package:flutter/material.dart';
import 'package:project_1/pages/DetailPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> foods = [
        {
            'nama': 'Tumis Kangkung',
            'harga': '20.000',
            'bahan': '1 ikat kangkung, bawang merah, bawang putih, terasi sachet, tomat, teri nasi, Cabe rawit dan merah, Penyedap rasa (mecin)',
            'gambar': 'https://images.unsplash.com/photo-1632879704262-1911cd5a36be?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
            'kategori': 'Sayuran',
            'rating': '4.8',
            'waktu': '15 menit',
        },
        {
            'nama': 'Sop Bayam Jagung',
            'harga': '15.000',
            'bahan': '1 ikat bayam, jagung, wortel, bawang putih, bawang merah, Kaldu bubuk, Garam, Gula pasir',
            'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxc3581ciHeN_Xkmm9ZA7dBecpGOxcU6P2m-kE3SujGA&s=10',
            'kategori': 'Sayuran',
            'rating': '4.0',
            'waktu': '25 menit',
        },
        {
            'nama': 'Telur Balado',
            'harga': '17.000',
            'bahan': '1/2 kg telur, bawang merah, bawang putih, cabai merah besar, cabai keriting, cabai rawit (opsional), biji kemiri yang telah disangrai, terasi ABC, tomat, kunyit, jahe, Daun salam, Gula Pasir, Royco ayam, Garam, ketumbar',
            'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT90apvqBN2zz6fFYdRj7bFK1xoG75nfvjDI7jjMsEFSQ&s=10',
            'kategori': 'Protein',
            'rating': '4.5',
            'waktu': '20 menit',
        },
    ];

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            leading: Icon(Icons.store),
            title: Text(
                'Daftar Menu Makanan',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
        ),
        body: SafeArea(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: foods.length,
                itemBuilder: (context, index) {
                    final food = foods[index];

                    return Card(
                        margin: EdgeInsets.only(bottom: 14),
                        color: Colors.white,
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                        ),
                        child: InkWell(
                            onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailpage(
                                            nama: food['nama']!,
                                            harga: food['harga']!,
                                            bahan: food['bahan']!,
                                            gambar: food['gambar']!,
                                            kategori: food['kategori']!,
                                            rating: food['rating']!,
                                            waktu: food['waktu']!,
                                        ),
                                    ),
                                );
                            },
                            child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.network(
                                                food['gambar']!,
                                                width: 90,
                                                height: 90,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) {
                                                    return Container(
                                                        width: 90,
                                                        height: 90,
                                                        color: Colors.grey.shade200,
                                                        child: Icon(Icons.store, color: Colors.redAccent),
                                                    );
                                                },
                                            ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Text(
                                                        food['nama']!,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16,
                                                        ),
                                                    ),
                                                    SizedBox(height: 2),
                                                    Text(
                                                        food['bahan']!,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                            color: Colors.grey.shade600,
                                                            fontSize: 13,
                                                        ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Row(
                                                        children: [
                                                            Icon(Icons.star, size: 16, color: Colors.redAccent),
                                                            SizedBox(width: 2),
                                                            Text(food['rating']!, style: TextStyle(fontSize: 13)),
                                                            SizedBox(width: 12),
                                                            Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                                                            SizedBox(width: 2),
                                                            Text(food['waktu']!, style: TextStyle(fontSize: 13)),
                                                        ],
                                                    ),
                                                    SizedBox(height: 4),
                                                    Text(
                                                        'Rp ${food['harga']!}',
                                                        style: TextStyle(
                                                            color: Colors.redAccent,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 15,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    );
                },
            ),
        ),
    );
  }
}