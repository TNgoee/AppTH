// import 'package:flutter/material.dart';
// import '../../data/model/productmodel.dart';
// import '../../conf/const.dart';

// Widget itemProductView(Product item) {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//     padding: const EdgeInsets.all(12),
//     decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))]),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(uri_product_img + item.img!, width: 80, height: 100, fit: BoxFit.cover)),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(item.name ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
//               const SizedBox(height: 8),
//               Text(item.des ?? '', maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//               const SizedBox(height: 8),
//               Text('${item.price} VNĐ', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
