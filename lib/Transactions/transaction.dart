import "package:flutter/material.dart";


class Transaction {
  int? amount;
  int? categoryId;
  String? categoryImageUrl;
  String? date;
  String? description;
  int? id;
  bool? isDeleted;

  Transaction(
      {this.amount,
      this.categoryId,
      this.categoryImageUrl,
      this.date,
      this.description,
      this.id,
      this.isDeleted}
      );

  Transaction.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    categoryId = json['category_id'];
    categoryImageUrl = json['category_image_url'];
    date = json['date'];
    description = json['description'];
    id = json['id'];
    isDeleted = json['is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['amount'] = amount;
    data['category_id'] = categoryId;
    data['category_image_url'] = categoryImageUrl;
    data['date'] = date;
    data['description'] =description;
    data['id'] = id;
    data['is_deleted'] = isDeleted;
    return data;
  }
}
