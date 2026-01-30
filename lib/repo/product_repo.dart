import 'package:bloc_practice/model/product_model.dart';
import 'package:bloc_practice/service/product_service.dart';

class ProductRepo {
  final ProductService productService;

  ProductRepo({required this.productService});

  Future<List<ProductModel>?> getProductModels() async {
    return null;
  }
}
