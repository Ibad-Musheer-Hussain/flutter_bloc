import 'package:bloc_practice/service/category_service.dart';

class CategoryRepo {
  final CategoryService categoryService;

  CategoryRepo({required this.categoryService});

  Future<dynamic> fetchData() async {
    return await categoryService.getData();
  }
}
