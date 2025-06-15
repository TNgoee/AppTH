import 'package:btbuoi1/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import '../../data/helper/base_database_helper.dart';
import '../../data/helper/database_service.dart';
import 'product_add.dart';

class ProductBuilder extends StatefulWidget {
  const ProductBuilder({Key? key}) : super(key: key);

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  final BaseDatabaseHelper _databaseHelper = DatabaseService.instance;

  Future<List<ProductModel>> _getProducts() async {
    return await _databaseHelper.products();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        count++;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return _buildProduct(product, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildProduct(ProductModel product, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading:
            product.img != null && product.img!.isNotEmpty
                ? Image.network(product.img!, width: 50, height: 50, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image))
                : const Icon(Icons.image_not_supported),
        title: Text(product.name ?? 'No name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.des != null && product.des!.isNotEmpty) Text(product.des!),
            Text("Price: \$${product.price ?? 0}"),
            Text("Category ID: ${product.catId ?? 'N/A'}"),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                await _databaseHelper.deleteProduct(product.id!);
                setState(() {}); // refresh UI
              },
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.yellow.shade800),
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => ProductAdd(isUpdate: true, productModel: product), fullscreenDialog: true)).then((_) => setState(() {}));
              },
            ),
          ],
        ),
      ),
    );
  }
}
