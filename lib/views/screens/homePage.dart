import 'package:flutter/material.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/contentPage.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/itemModel.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = '/home';

  final data = List.generate(
    30,
        (index) => ItemModel(
      id: index,
      name: 'Product $index',
      description: 'Product $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    void onItemTap(ItemModel item) {
      Navigator.pushNamed(context, ContentPage.routeName, arguments: item);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
            onTap: () => onItemTap(item),
          );
        },
      ),
    );
  }
}
