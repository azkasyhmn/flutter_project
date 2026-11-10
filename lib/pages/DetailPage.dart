import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  final String nama, harga, bahan, gambar, kategori, rating, waktu;

  const Detailpage({
    super.key,
    required this.nama,
    required this.harga,
    required this.bahan,
    required this.gambar,
    required this.kategori,
    required this.rating,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                            ),
                            child: Image.network(
                                gambar,
                                width: double.infinity,
                                height: 280,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                        width: double.infinity,
                                        height: 280,
                                        color: Colors.grey.shade200,
                                        child: Icon(Icons.store, size: 60, color: Colors.redAccent),
                                    );
                                },
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Container(
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.redAccent,
                                                width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                            kategori,
                                            style: TextStyle(
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.w600,
                                            ),
                                        ),
                                    ),
                                    SizedBox(height: 12),
                                    Text(
                                        nama,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                        ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                        'Rp $harga',
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                        ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                        children: [
                                            Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red.shade50,
                                                        borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                            Icon(Icons.star, color: Colors.redAccent, size: 20),
                                                            SizedBox(width: 6),
                                                            Text(rating, style: TextStyle(fontWeight: FontWeight.w600)),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 12),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red.shade50,
                                                        borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                            Icon(Icons.access_time, color: Colors.redAccent, size: 20),
                                                            SizedBox(width: 6),
                                                            Text(waktu, style: TextStyle(fontWeight: FontWeight.w600)),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                        ],
                                    ),
                                    SizedBox(height: 20),
                                    Divider(color: Colors.grey.shade300, height: 10),
                                    SizedBox(height: 10),
                                    Text(
                                        'Bahan-bahan',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                        ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                        bahan,
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            height: 1.5,
                                        ),
                                    ),
                                    SizedBox(height: 24),
                                    SizedBox(
                                        width: double.infinity,
                                        height: 48,
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                                Navigator.pop(context);
                                            },
                                            label: Text('Kembali', style: TextStyle(fontWeight: .bold),),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.redAccent,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                ),
                                            ),
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
  }
}