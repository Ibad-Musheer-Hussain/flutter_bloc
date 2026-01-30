import 'dart:developer';

import 'package:bloc_practice/model/category_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryService {
  final supabase = Supabase.instance.client;

  Future<List<CategoryModel>?> getData() async {
    try {
      final response = await supabase.rpc('get_all_categories');

      if (response != null) {
        final List<CategoryModel> categories = (response as List<dynamic>)
            .map((categoryData) =>
                CategoryModel.fromJson(categoryData as Map<String, dynamic>))
            .toList();

        return categories;
      }
    } catch (e) {
      log("Error in CategoryService - Get Data: $e");
    }

    return [];
  }
}
