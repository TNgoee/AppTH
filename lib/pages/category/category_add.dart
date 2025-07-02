// import 'package:btbuoi1/data/model/categorymodel.dart';
// import 'package:flutter/material.dart';
// import '../../data/helper/base_database_helper.dart';
// import '../../data/helper/database_service.dart';

// class CategoryAdd extends StatefulWidget {
//   final bool isUpdate;
//   final CategoryModel? categoryModel;
//   const CategoryAdd({super.key, this.isUpdate = false, this.categoryModel});

//   @override
//   State<CategoryAdd> createState() => _CategoryAddState();
// }

// class _CategoryAddState extends State<CategoryAdd> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descController = TextEditingController();
//   String titleText = "";
//   final BaseDatabaseHelper _databaseHelper = DatabaseService.instance;
//   Future<void> _onSave() async {
//     final name = _nameController.text;
//     final description = _descController.text;

//     await _databaseHelper.insertCategory(CategoryModel(name: name, desc: description));
//     setState(() {});
//     Navigator.pop(context);
//   }

//   Future<void> _onUpdate() async {
//     final name = _nameController.text;
//     final description = _descController.text;

//     await _databaseHelper.updateCategory(CategoryModel(name: name, desc: description, id: widget.categoryModel!.id));

//     Navigator.pop(context);
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     if (widget.categoryModel != null && widget.isUpdate) {
//       _nameController.text = widget.categoryModel!.name;
//       _descController.text = widget.categoryModel!.desc;
//     }
//     if (widget.isUpdate) {
//       titleText = "Update Category";
//     } else
//       titleText = "Add New Category";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(titleText), centerTitle: true),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(controller: _nameController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter name')),
//             const SizedBox(height: 16.0),
//             TextField(controller: _descController, maxLines: 7, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter description')),
//             const SizedBox(height: 16.0),
//             SizedBox(
//               height: 45.0,
//               child: ElevatedButton(
//                 onPressed: () {
//                   widget.isUpdate ? _onUpdate() : _onSave();
//                 },
//                 child: const Text('Save', style: TextStyle(fontSize: 16.0)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
