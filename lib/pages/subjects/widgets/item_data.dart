import 'package:flutter/material.dart';

class ItemModel {
  bool expanded;
  String headerItem;
  Column itens;
  ItemModel(
      {this.expanded = false, required this.headerItem, required this.itens});
}