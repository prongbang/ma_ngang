import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ma_ngang/model/chapter.dart';

class ChapterRepository {

  Future<List<Chapter>> getChapterByPath(AssetBundle assetBundle, String jsonPath) async {
    String data = await assetBundle.loadString(jsonPath);
    final List<dynamic> jsonResult = json.decode(data);
    final List<Chapter> cat = jsonResult.map((f) => new Chapter.fromMap(f)).toList();
    return cat;
  }

}