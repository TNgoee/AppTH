// import 'package:flutter/material.dart';
// import '../../data/model/productmodel.dart';
// import '../../data/provider/productprovider.dart';
// import 'productbody.dart';
// import '../../conf/const.dart';

// class ProductWidget extends StatefulWidget {
//   const ProductWidget({super.key});

//   @override
//   State<ProductWidget> createState() => _ProductWidgetState();
// }

// class _ProductWidgetState extends State<ProductWidget> {
//   List<Product> lstProduct = [];
//   Future<String> loadProductList() async {
//     lstProduct = await ReadData().loadData();
//     return '';
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadProductList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadProductList(),
//       builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//         return Center(
//           child: Column(
//             children: [
//               const Text("Product list", style: titleStyle),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: lstProduct.length,
//                   itemBuilder: (context, index) {
//                     return itemProductView(lstProduct[index]);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
