import 'package:flutter/material.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/detailPage.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/itemModel.dart';
import 'dart:math';

// your existing imports here

class ContentPage extends StatefulWidget {
  const ContentPage ({super.key});

  static const routeName = '/content';

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late Future<String> _imageUrlFuture;

  @override
  void initState() {
    super.initState();
    _imageUrlFuture = _getRandomImageUrl();
  }

  Future<String> _getRandomImageUrl() async {
    final random = Random();
    final width = random.nextInt(500) + 200;
    final height = random.nextInt(500) + 200;
    final imageUrl = 'https://picsum.photos/$width/$height';
    return Future.delayed(Duration(seconds: 2), () => imageUrl);
  }



  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ItemModel;

    void onMorePressed() {
      Navigator.pushNamed(context, DetailPage.routeName, arguments: data);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is ${data.description}:"),
            const SizedBox(height: 16),
            FutureBuilder<String>(
              future: _imageUrlFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(snapshot.data!),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Image.asset('assets/loading.gif');
                }
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onMorePressed,
              child: const Text('More Info'),
            ),
          ],
        ),
      ),
    );
  }
}

