
import 'package:flutter/material.dart';

class NavigatorUtil {

  static String NAV_CHAPTER = '/chapter';


  static void toChapter(context) {
    Navigator.of(context).pushNamed(NAV_CHAPTER);
  }
}