import 'package:flutter/material.dart';

class MagazineListModel {
  final int id;
  final String label;
  final String mainTitle;
  final String subTitle;
  final String fontColor;
  final AssetImage bgImage;
  final String date;

  MagazineListModel(this.id, this.label, this.mainTitle, this.subTitle, this.fontColor, this.bgImage, this.date);
}