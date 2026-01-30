import 'dart:developer';

import 'package:bloc_practice/model/category_model.dart';
import 'package:bloc_practice/service/category_service.dart';

class CategoryRepo {
  final CategoryService categoryService;

  CategoryRepo({required this.categoryService});

  Future<List<CategoryModel>?> fetchData() async {
    try {
      final categories = await categoryService.getData();

      if (categories != null && categories.isNotEmpty) {
        return categories;
      }
    } catch (e) {
      log("Error in CategoryRepo - Fetch Data: $e");
    }

    return [];
  }
}
