import 'package:major_craft_application/features/categories/presentation/models/subSub_categories_model.dart';

class SubCategoriesModel {
  SubCategoriesModel({
    required this.id,
    required this.title,
    required this.subSubCategories,
  });
  final int id;
  final List<SubSubCategoriesModel> subSubCategories;
  final String title;
}
