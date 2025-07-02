import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../conf/const.dart';
import '../../data/model/product_viewmodel.dart';
import '../../data/model/productmodel.dart';

Widget itemGridView(ProductModel productModel, WidgetRef ref) {
  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(10.0)), border: Border.all(color: Colors.lightBlue, width: 1.5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(uri_product_img + productModel.img!, height: 100, errorBuilder: (context, error, stackTrace) => const Icon(Icons.image)),
        ),
        Text(productModel.name ?? '', textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text(
          NumberFormat('###,###.###').format(productModel.price),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
          selectionColor: const Color.fromARGB(255, 0, 0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.add, color: Colors.white, size: 24),
              label: const Text('Add'),
              onPressed: () {
                ref.read(productsProvider.notifier).addToCart(productModel);
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ),
  );
}
