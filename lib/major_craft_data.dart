import 'package:major_craft_application/core/localization/generated/l10n.dart';
import 'package:major_craft_application/features/account/presentation/models/account_item_model.dart';
import 'package:major_craft_application/features/blog/presentation/models/blog_detail_model.dart';
import 'package:major_craft_application/features/blog/presentation/models/blog_model.dart';
import 'package:major_craft_application/features/categories/presentation/models/categories_model.dart';
import 'package:major_craft_application/features/categories/presentation/models/subSub_categories_model.dart';
import 'package:major_craft_application/features/categories/presentation/models/sub_categories_model.dart';
import 'package:major_craft_application/features/home/data/models/card_model.dart';
import 'package:major_craft_application/resources/assets.gen.dart';

abstract class MajorCraftData {
  // static const Map<int, String> sexMap = {
  //   0: 'Male',
  //   1: 'Female',
  //   2: 'Other',
  // };
  static final Map<int, String> sexMap = {
    0: Lang.current.male,
    1: Lang.current.female,
    2: Lang.current.other,
  };

  static final List<String> recentSearch = [
    'Fishing Rod',
    'Fishing Rod Super',
    'Fishing Rod Super Vip',
    'Fishing Rod Super Vip Pro',
  ];

  static final List<CardModel> listProduct = [
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
  ];

  static final List<CardModel> listFishingProduct = [
    CardModel(
      description:
          'Combo cần câu spincasting - baitcasting telescoping rod 1.68m 1.8m lure fishing rod 8.1: 1 baitcasing reel pesca rod + reel kit 1',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Combo cần câu spincasting - baitcasting telescoping rod 1.68m 1.8m lure fishing rod 8.1: 1 baitcasing reel pesca rod + reel kit 2',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 280000,
      discount: 15,
      quantityBought: 35,
    ),
    CardModel(
      description:
          'Combo cần câu spincasting - baitcasting telescoping rod 1.68m 1.8m lure fishing rod 8.1: 1 baitcasing reel pesca rod + reel kit 3',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 400000,
      discount: 5,
      quantityBought: 50,
    ),
    CardModel(
      description: 'Another Combo description 4',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 300000,
      discount: 12,
      quantityBought: 42,
    ),
    CardModel(
      description: 'Example Combo description 5',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 350000,
      discount: 8,
      quantityBought: 38,
    ),
    CardModel(
      description: 'Special Combo description 6',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 260000,
      discount: 20,
      quantityBought: 55,
    ),
    CardModel(
      description: 'Unique Combo description 7',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 380000,
      discount: 7,
      quantityBought: 48,
    ),
    CardModel(
      description: 'Exclusive Combo description 8',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 290000,
      discount: 18,
      quantityBought: 37,
    ),
    CardModel(
      description: 'Premium Combo description 9',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 420000,
      discount: 9,
      quantityBought: 46,
    ),
    CardModel(
      description: 'Superior Combo description 10',
      imageName: Assets.images.searchFishingProduct.path,
      categoryItem: 'FISHING',
      price: 310000,
      discount: 14,
      quantityBought: 44,
    ),
  ];
  static final List<BlogModel> listBlog = [
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner3.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner2.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
    BlogModel(
      content: 'Vintage Fashion: Modernizing Classic Looks Vintage Fashion: Modernizing Classic Looks',
      imageSrc: Assets.images.banner1.path,
      createdAt: '23, Sep 2023',
      readedTime: '4 ${Lang.current.minRead}',
    ),
  ];
  static final List<CategoriesModel> listCategories = [
    CategoriesModel(
      id: 0,
      svgSrc: Assets.icons.categoriesFishing.path,
      title: 'Fishing',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod 1',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR1',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod 2',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR2',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 2,
          title: 'Reel',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR3',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 3,
          title: 'Lure',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 4,
          title: 'Line',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 5,
          title: 'Etc',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 1,
      svgSrc: Assets.icons.categoriesSunglasses.path,
      title: 'Outdoor',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 2,
          title: 'Reel Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 3,
          title: 'Lure Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 4,
          title: 'Line Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 5,
          title: 'Etc Outdoor',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 2,
      svgSrc: Assets.icons.categoriesVolleyball.path,
      title: 'Sports',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod Sports',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod Sports',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 2,
          title: 'Reel Sports',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 3,
      svgSrc: Assets.icons.categoriesMotocrycle.path,
      title: 'Vehicle',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod Vehicle',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod Vehicle',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 4,
      svgSrc: Assets.icons.categoriesLaptop.path,
      title: 'Computer',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 5,
      svgSrc: Assets.icons.categoriesTool.path,
      title: 'Tool',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 6,
      svgSrc: Assets.icons.categoriesArmchair.path,
      title: 'Home Applicances',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 7,
      svgSrc: Assets.icons.categoriesLipstick.path,
      title: 'Cosmetic',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 8,
      svgSrc: Assets.icons.categoriesNotebook.path,
      title: 'Book',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 9,
      svgSrc: Assets.icons.categoriesFood.path,
      title: 'Food',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 10,
      svgSrc: Assets.icons.categoriesShirtfolded.path,
      title: 'Clothing',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 11,
      svgSrc: Assets.icons.categoriesFishing.path,
      title: 'Clothing',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 12,
      svgSrc: Assets.icons.categoriesFishing.path,
      title: 'Clothing',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
    CategoriesModel(
      id: 13,
      svgSrc: Assets.icons.categoriesFishing.path,
      title: 'Clothing',
      subCategories: [
        SubCategoriesModel(
          id: 0,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
        SubCategoriesModel(
          id: 1,
          title: 'Rod',
          subSubCategories: [
            SubSubCategoriesModel(
              id: 0,
              title: 'XR5',
              imageSrc: Assets.images.imageProduct1.path,
            ),
            SubSubCategoriesModel(
              id: 1,
              title: 'TCX',
              imageSrc: Assets.images.imageProduct2.path,
            ),
            SubSubCategoriesModel(
              id: 2,
              title: 'CXR',
              imageSrc: Assets.images.banner1.path,
            ),
            SubSubCategoriesModel(
              id: 3,
              title: 'HAHA',
              imageSrc: Assets.images.banner2.path,
            ),
          ],
        ),
      ],
    ),
  ];
  static final BlogDetailModel blogDetail = BlogDetailModel(
    content:
        'Sed lectus amet, eu lacus viverra magna ullamcorper ultricies. Laoreet est molestie tellus, volutpat, vitae. Viverra vitae nunc molestie nec. Id orci tincidunt amet ullamcorper morbi mauris augue. Faucibus ornare tincidunt malesuada phasellus.Volutpat, est id tincidunt dolor eu. Enim dictum aenean ultrices pharetra lorem leo cursus. Mollis dui turpis sed suscipit. Mauris vestibulum in phasellus velit morbi lobortis varius egestas posuere. Commodo purus non adipiscing porttitor lectus nunc, nisi. Urna amet, nisl, lectus vel. Aliquam, porttitor quis at vel sed ut montes, egestas. Nisl, vestibulum tempor natoque lacinia posuere. Risus id tempor turpis faucibus ante volutpat nunc. Viverra iaculis iaculis at convallis tellus. Condimentum massa faucibus at porttitor vestibulum in.Sed lectus amet, eu lacus viverra magna ullamcorper ultricies. Laoreet est molestie tellus, volutpat, vitae. Viverra vitae nunc molestie nec. Id orci tincidunt amet ullamcorper morbi mauris augue. Faucibus ornare tincidunt malesuada phasellus.Volutpat, est id tincidunt dolor eu. Enim dictum aenean ultrices pharetra lorem leo cursus. Mollis dui turpis sed suscipit. Mauris vestibulum in phasellus velit morbi lobortis varius egestas posuere. Commodo purus non adipiscing porttitor lectus nunc, nisi. Urna amet, nisl, lectus vel. Aliquam, porttitor quis at vel sed ut montes, egestas. Nisl, vestibulum tempor natoque lacinia posuere. Risus id tempor turpis faucibus ante volutpat nunc. Viverra iaculis iaculis at convallis tellus. Condimentum massa faucibus at porttitor vestibulum in.Sed lectus amet, eu lacus viverra magna ullamcorper ultricies. Laoreet est molestie tellus, volutpat, vitae. Viverra vitae nunc molestie nec. Id orci tincidunt amet ullamcorper morbi mauris augue. Faucibus ornare tincidunt malesuada phasellus.Volutpat, est id tincidunt dolor eu. Enim dictum aenean ultrices pharetra lorem leo cursus. Mollis dui turpis sed suscipit. Mauris vestibulum in phasellus velit morbi lobortis varius egestas posuere. Commodo purus non adipiscing porttitor lectus nunc, nisi. Urna amet, nisl, lectus vel. Aliquam, porttitor quis at vel sed ut montes, egestas. Nisl, vestibulum tempor natoque lacinia posuere. Risus id tempor turpis faucibus ante volutpat nunc. Viverra iaculis iaculis at convallis tellus. Condimentum massa faucibus at porttitor vestibulum in.',
    title: 'The Modern House Blog',
    createdAt: '23 Septemper 2023',
  );

  static final Map<int, String> categoryMap = {
    0: 'FISHING',
    1: 'OUTDOOR',
    2: 'SPORT',
    3: 'VEHICLE',
    5: 'OUTDOOR',
    6: 'SPACE',
    7: 'RIVER',
    8: 'WATERFALL',
    9: 'ARRIVAL',
  };

  static final Map<int, String> subCategory = {
    0: 'ROD',
    1: 'REEL',
    2: 'LURE',
    3: 'LINE',
    5: 'LURE',
    6: 'STAR',
    7: 'DEW',
    8: 'VALLEY',
    9: 'GRASS',
  };

  static final Map<int, String> subChildrenCategory = {
    0: 'ALL',
    1: 'XR5',
    2: 'TCX',
    3: 'CRX',
    5: 'SPX',
    6: 'NSS',
    7: 'TTA',
    8: 'TCX',
    9: 'TYPE OF ROD',
    10: 'LEVENT',
    11: 'TYPE OF HOOK',
    12: 'TYPE OF PEOPLE',
  };

  static final Map<int, String> priceMap = {
    0: '${Lang.current.upTo} \$15',
    1: '\$15 - \$30',
    2: '\$30 - \$50',
    3: '\$50 - \$100',
    5: '\$100 & ${Lang.current.above}',
  };

  static final List<CardModel> cards = [
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
    CardModel(
      description:
          'Bộ Hai Chiếc Phong Cách Thể Thao Thường Ngày Áo Khoác Ngắn Chống Nắng Phối Rộng Rãi Mùa Hè Cho Nữ Bộ Quần Short Ống Rộng Mẫu Mới 2023',
      imageName: Assets.images.imageProduct1.path,
      categoryItem: 'CLOTHING',
      price: 320000,
      discount: 10,
      quantityBought: 40,
    ),
  ];

  static final List<AccountItem> listLanguage = [
    AccountItem(iconPath: Assets.icons.vi.path, label: 'Vietnamese'),
    AccountItem(iconPath: Assets.icons.us.path, label: 'English'),
  ];
}
