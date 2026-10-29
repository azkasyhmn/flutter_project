import 'package:flutter/material.dart';
import 'package:project_1/api_service.dart';
import 'package:project_1/pages/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Berita',
      debugShowCheckedModeBanner: false,
      home: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>> _articles;

  final ScrollController _scrollController = ScrollController();

  bool _showScrollToStop = false;

  @override
  void initState() {
    super.initState();
        _articles = ApiService().fetchArticles();
        _scrollController.addListener((){
            final shouldShow = _scrollController.offset > 300;
            if (shouldShow != _showScrollToStop) {
                setState((){
                    _showScrollToStop = shouldShow;
                });
            }
     });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refreshArticles() async {
    final newFuture = ApiService().fetchArticles();

    setState((){
        _articles = newFuture;
    });

    try {
        await newFuture;
    } catch (_) {
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
        0, 
        duration: const Duration(milliseconds: 500), 
        curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aplikasi Berita',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: const Icon(Icons.newspaper, color: Colors.white,),
      ),
      body: FutureBuilder<List<Article>>(
        future: _articles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return RefreshIndicator(
                onRefresh: _refreshArticles, 
                child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Center(
                                child: Text('Error : ${snapshot.error}'),
                            ),
                        ),
                    ],
                ),
            );
          }

          final articles = snapshot.data ?? <Article>[];
          if (articles.isEmpty) {
            return RefreshIndicator(
                onRefresh: _refreshArticles, 
                child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: const Center(child: Text("Tidak ada berita")),
                        ),
                    ],
                ),
            );
          }
          
          return RefreshIndicator(
            onRefresh: _refreshArticles, 
            child: ListView.builder(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                final article = articles[index];

                return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        if (article.urlToImage != null)
                            Image.network(
                            article.urlToImage!.replaceFirst('http://', 'https://'),
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                                debugPrint('Gagal load gambar: ${article.urlToImage}');
                                debugPrint('Error: $error');
                                return const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                );
                            },
                            ),
                        const SizedBox(height: 8),
                        Text(
                            article.title ?? 'Tanpa judul',
                            style: const TextStyle(
                            fontWeight: FontWeight.bold
                            ),
                        ),
                        const SizedBox(height: 5),
                        Text(article.description ?? ''),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: _showScrollToStop ?
        FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.arrow_upward, color: Colors.white),
           )
        : null,
    );
  }
}