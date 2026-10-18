import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PlayStoreStylePage(),
    );
  }
}

class PlayStoreStylePage extends StatelessWidget {
  const PlayStoreStylePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Play'),
          actions: [
            IconButton(
              tooltip: 'Cari aplikasi',
              icon: const Icon(Icons.search),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Buka pencarian')),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 16,
                child: Text('A', style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              Tab(text: 'Untuk Anda'),
              Tab(text: 'Teratas'),
              Tab(text: 'Kategori'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Rekomendasi aplikasi untuk Anda')),
            Center(child: Text('Daftar aplikasi teratas')),
            Center(child: Text('Jelajahi aplikasi berdasarkan kategori')),
          ],
        ),
      ),
    );
  }

}