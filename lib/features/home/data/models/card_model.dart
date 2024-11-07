class CardModel {
  CardModel({
    required this.description,
    required this.imageName,
    required this.categoryItem,
    required this.price,
    required this.discount,
    required this.quantityBought,
  });
  final String description;
  final String imageName;
  final String categoryItem;
  final int price;
  final int discount;
  final int quantityBought;
}
