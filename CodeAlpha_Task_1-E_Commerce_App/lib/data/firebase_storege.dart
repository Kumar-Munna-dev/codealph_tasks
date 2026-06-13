import 'package:shopitem/data/product_data.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorege {
  final storage = FirebaseStorage.instance;
  Future<List<ProductData>> getProductsImage(String productId) async {
    return [];
  }
  Future<List<ProductData>> getProductsRating(String productId) async {
    return [];
  }
  Future<List<ProductData>> getProducts() async {
    return [];
  }
}
