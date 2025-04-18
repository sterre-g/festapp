import 'package:fstapp/data/models/eshop/tb_eshop.dart';

class ProductModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  bool? isHidden;
  String? description;
  double? price;
  Map<String, dynamic>? data;
  int? productType;
  int? occasion;
  String? productTypeString;
  int? order;
  int? maximum;
  int? orderedCount;

  static const String foodType = "food";
  static const String taxiType = "taxi";
  static const String spotType = "spot";
  static const String metaTypeField = "type";
  static const String metaOrderedCount = "ordered_count";

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json[TbEshop.products.id],
        createdAt: json[TbEshop.products.created_at] != null
            ? DateTime.parse(json[TbEshop.products.created_at])
            : null,
        updatedAt: json[TbEshop.products.updated_at] != null
            ? DateTime.parse(json[TbEshop.products.updated_at])
            : null,
        title: json[TbEshop.products.title],
        isHidden: json[TbEshop.products.is_hidden],
        description: json[TbEshop.products.description],
        price: json[TbEshop.products.price] != null
            ? double.tryParse(json[TbEshop.products.price].toString())
            : null,
        data: json[TbEshop.products.data],
        productType: json[TbEshop.products.product_type],
        occasion: json[TbEshop.products.occasion],
        productTypeString: json[metaTypeField],
        order: json[TbEshop.products.order],
        maximum: json[TbEshop.products.maximum],
        orderedCount: json[metaOrderedCount]
    );
  }

  Map<String, dynamic> toJson() => {
    TbEshop.products.id: id,
    TbEshop.products.title: title,
    TbEshop.products.is_hidden: isHidden,
    TbEshop.products.description: description,
    TbEshop.products.price: price,
    TbEshop.products.data: data,
    TbEshop.products.product_type: productType,
    TbEshop.products.occasion: occasion,
    TbEshop.products.order: order,
    TbEshop.products.maximum: maximum,
  };

  String toBasicString() => title ?? id.toString();

  ProductModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.isHidden,
    this.description,
    this.price,
    this.data,
    this.productType,
    this.occasion,
    this.productTypeString,
    this.order,
    this.maximum,
    this.orderedCount,
  });
}
