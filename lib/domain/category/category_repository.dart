import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ma_ngang/model/category.dart';

class CategoryRepository {

  Future<List<Category>> getCategory(AssetBundle assetBundle) async {
    String data = await assetBundle.loadString("assets/mangga/category.json");
    final List<dynamic> jsonResult = json.decode(data);
    final List<Category> cat = jsonResult.map((f) => new Category.fromMap(f)).toList();
    return cat;
  }
}
