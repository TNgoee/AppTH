import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'productmodel.dart';

class ProductsNotifier extends Notifier<Map<String, List<ProductModel>>> {
  @override
  Map<String, List<ProductModel>> build() => {'cart': []};

  void addToCart(ProductModel mo) {
    state = {
      ...state,
      'cart': [...state['cart']!, mo],
    };
  }

  void removeFromCart(int index) {
    final cart = [...state['cart']!]..removeAt(index);
    state = {...state, 'cart': cart};
  }
}

final productsProvider = NotifierProvider<ProductsNotifier, Map<String, List<ProductModel>>>(() => ProductsNotifier());
