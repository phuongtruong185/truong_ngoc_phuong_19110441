import 'package:flutter/material.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/itemModel.dart';

class DetailPage extends StatelessWidget {
  const DetailPage ({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ItemModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${data.name}'),
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: Center(child: CircularProgressIndicator()),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/1080/1920?${DateTime.now().millisecondsSinceEpoch}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: FractionallySizedBox(
                widthFactor: 0.8, // adjust the width of the image as needed
                heightFactor: 0.8, // adjust the height of the image as needed
                child: Image.network(
                  'https://picsum.photos/1080/1920?${DateTime.now().millisecondsSinceEpoch}',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
