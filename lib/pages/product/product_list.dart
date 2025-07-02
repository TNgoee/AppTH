import 'package:flutter/material.dart';
import '../../data/data/productdata.dart';
import '../../data/model/productmodel.dart';
import 'productbody.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductList extends ConsumerStatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {
  List<ProductModel> lstProduct = [];

  Future<String> loadProdList() async {
    lstProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadProdList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: loadProdList(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return GridView.builder(
              itemCount: lstProduct.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 4, mainAxisSpacing: 8),
              itemBuilder: (context, index) {
                return itemGridView(lstProduct[index], ref);
              },
            );
          },
        ),
      ),
    );
  }
}
