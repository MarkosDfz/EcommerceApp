// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';
// import 'package:intl/intl.dart';

// final oCcy = new NumberFormat("#,##0.00", "en_US");

List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Store {
    Store({
        this.id,
        this.storeName,
        this.createdAt,
        this.updatedAt,
        this.scoreStore,
        this.descStore,
        this.logoStore,
        this.imgHeader,
        this.open,
        this.close,
        this.products,
        this.comments,
    });

    int id;
    String storeName;
    DateTime createdAt;
    DateTime updatedAt;
    double scoreStore;
    String descStore;
    String logoStore;
    String imgHeader;
    String open;
    String close;
    List<Product> products;
    List<dynamic> comments;

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        storeName: json["storeName"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        scoreStore: json["scoreStore"] == null ? null : json["scoreStore"].toDouble(),
        descStore: json["descStore"] == null ? null : json["descStore"],
        logoStore: json["logoStore"],
        imgHeader: json["imgHeader"] == null ? null : json["imgHeader"],
        open: json["open"] == null ? null : json["open"],
        close: json["close"] == null ? null : json["close"],
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        comments: json["comments"] == null ? null : List<dynamic>.from(json["comments"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "storeName": storeName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "scoreStore": scoreStore,
        "descStore": descStore == null ? null : descStore,
        "logoStore": logoStore,
        "imgHeader": imgHeader == null ? null : imgHeader,
        "open": open == null ? null : open,
        "close": close == null ? null : close,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "comments": List<dynamic>.from(comments.map((x) => x)),
    };
}

class Product {
    Product({
        this.id,
        this.nameProd,
        this.qtyProd,
        this.priceProd,
        this.imgProd,
        this.availableProd,
        this.descripPod,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String nameProd;
    int qtyProd;
    double priceProd;
    String imgProd;
    bool availableProd;
    String descripPod;
    DateTime createdAt;
    DateTime updatedAt;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nameProd: json["nameProd"],
        qtyProd: json["qtyProd"],
        priceProd: json["priceProd"].toDouble(),
        imgProd: json["imgProd"],
        availableProd: json["availableProd"],
        descripPod: json["descripPod"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameProd": nameProd,
        "qtyProd": qtyProd,
        "priceProd": priceProd,
        "imgProd": imgProd,
        "availableProd": availableProd,
        "descripPod": descripPod,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };

    getPrice() {
      // return oCcy.format(priceProd);
      return priceProd.toStringAsFixed(priceProd.truncateToDouble() == priceProd ? 0 : 2);
    }
}