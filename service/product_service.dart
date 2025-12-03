import 'package:bloc_practice/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final _client = Supabase.instance.client;

  Future<ProductModel?> getProducts() async {
    return null;
  }
}
