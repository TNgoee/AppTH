import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../conf/const.dart';
import '../../data/model/product_viewmodel.dart';
import '../../data/model/productmodel.dart';

class ProductCart extends ConsumerWidget {
  const ProductCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(productsProvider)['cart']!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Danh sách hàng hóa đã chọn", style: TextStyle(fontSize: 24, color: Colors.amber)),
        Expanded(
          child: Scaffold(
            body: SafeArea(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return itemListView(cart[index], ref, index);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget itemListView(ProductModel productModel, WidgetRef ref, int index) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              uri_product_img + productModel.img!,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.name ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(NumberFormat('###,###.###').format(productModel.price), style: const TextStyle(fontSize: 15, color: Colors.red)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              ref.read(productsProvider.notifier).removeFromCart(index);
            },
          ),
        ],
      ),
    );
  }
}
