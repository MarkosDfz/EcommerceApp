// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:store/src/models/store_model.dart';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
    Category({
        this.id,
        this.nameCategory,
        this.createdAt,
        this.updatedAt,
        this.iconCategory,
        this.stores,
    });

    int id;
    String nameCategory;
    DateTime createdAt;
    DateTime updatedAt;
    String iconCategory;
    List<Store> stores;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameCategory: json["nameCategory"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        iconCategory: json["iconCategory"],
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameCategory": nameCategory,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "iconCategory": iconCategory,
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
    };
}