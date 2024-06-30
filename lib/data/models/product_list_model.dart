import 'package:ecommerce/data/models/product_model.dart';

class ProductList {
  String? msg;
  List<Product>? productListByCategory;

  ProductList({this.msg, this.productListByCategory});

  ProductList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productListByCategory = <Product>[];
      json['data'].forEach((v) {
        productListByCategory!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productListByCategory != null) {
      data['data'] = productListByCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}