import 'package:btbuoi1/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import '../../data/helper/base_database_helper.dart';
import '../../data/helper/database_service.dart';
import 'product_add.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final BaseDatabaseHelper _databaseHelper = DatabaseService.instance;
  bool isGrid = false;

  Future<List<ProductModel>> _getProducts() async {
    return await _databaseHelper.products();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.view_list : Icons.grid_view),
            tooltip: isGrid ? "Switch to List View" : "Switch to Grid View",
            onPressed: () {
              setState(() {
                isGrid = !isGrid;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: _getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data ?? [];
          // if (products.isEmpty) {
          //   return const Center(child: Text("No products available"));
          // }

          return Padding(padding: const EdgeInsets.all(8.0), child: isGrid ? _buildGrid(products) : _buildList(products));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProductAdd(), fullscreenDialog: true)).then((_) => setState(() {}));
        },
        tooltip: 'Add New Product',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: product.img != null && product.img!.isNotEmpty ? NetworkImage(product.img!) : null,
              child: (product.img == null || product.img!.isEmpty) ? const Icon(Icons.image) : null,
            ),
            title: Text(product.name ?? 'No Name'),
            subtitle: Text("Price: \$${product.price ?? 0}"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductAdd(isUpdate: true, productModel: product))).then((_) => setState(() {}));
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildGrid(List<ProductModel> products) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (_, index) {
        final product = products[index];
        return Card(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ProductAdd(isUpdate: true, productModel: product))).then((_) => setState(() {}));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child:
                      product.img != null && product.img!.isNotEmpty
                          ? Image.network(product.img!, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.broken_image))
                          : const Icon(Icons.image, size: 60),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name ?? "No Name", style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Text("Price: \$${product.price ?? 0}")),
              ],
            ),
          ),
        );
      },
    );
  }
}
