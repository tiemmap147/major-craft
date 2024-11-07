import 'package:major_craft_application/features/categories/presentation/models/sub_categories_model.dart';

class CategoriesModel {
  CategoriesModel({
    required this.id,
    required this.svgSrc,
    required this.title,
    required this.subCategories,
  });
  final int id;
  final String svgSrc;
  final String title;
  final List<SubCategoriesModel> subCategories;
}
