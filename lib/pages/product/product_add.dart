import 'package:btbuoi1/data/model/productmodel.dart';
import 'package:flutter/material.dart';

import '../../data/helper/base_database_helper.dart';
import '../../data/helper/database_service.dart';

class ProductAdd extends StatefulWidget {
  final bool isUpdate;
  final ProductModel? productModel;

  const ProductAdd({super.key, this.isUpdate = false, this.productModel});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _catIdController = TextEditingController();

  final BaseDatabaseHelper _databaseHelper = DatabaseService.instance;
  String titleText = "";

  Future<void> _onSave() async {
    final name = _nameController.text;
    final price = int.tryParse(_priceController.text) ?? 0;
    final img = _imgController.text;
    final des = _descController.text;
    final catId = int.tryParse(_catIdController.text) ?? 0;

    await _databaseHelper.insertProduct(ProductModel(name: name, price: price, img: img, des: des, catId: catId));
    Navigator.pop(context);
  }

  Future<void> _onUpdate() async {
    final name = _nameController.text;
    final price = int.tryParse(_priceController.text) ?? 0;
    final img = _imgController.text;
    final des = _descController.text;
    final catId = int.tryParse(_catIdController.text) ?? 0;

    await _databaseHelper.updateProduct(ProductModel(id: widget.productModel!.id, name: name, price: price, img: img, des: des, catId: catId));
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.productModel != null && widget.isUpdate) {
      _nameController.text = widget.productModel!.name ?? "";
      _priceController.text = widget.productModel!.price?.toString() ?? "";
      _imgController.text = widget.productModel!.img ?? "";
      _descController.text = widget.productModel!.des ?? "";
      _catIdController.text = widget.productModel!.catId?.toString() ?? "";
    }

    titleText = widget.isUpdate ? "Update Product" : "Add New Product";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleText), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          // Thêm để tránh lỗi tràn khi bàn phím bật
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(controller: _nameController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter product name')),
              const SizedBox(height: 12.0),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter product price'),
              ),
              const SizedBox(height: 12.0),
              TextField(controller: _imgController, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter image URL or path')),
              const SizedBox(height: 12.0),
              TextField(controller: _descController, maxLines: 4, decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter product description')),
              const SizedBox(height: 12.0),
              TextField(
                controller: _catIdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Enter category ID'),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 45.0,
                child: ElevatedButton(
                  onPressed: () {
                    widget.isUpdate ? _onUpdate() : _onSave();
                  },
                  child: const Text('Save', style: TextStyle(fontSize: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
