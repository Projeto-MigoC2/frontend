class ItemModel {
  bool expanded;
  String headerItem;
  List<String> itens;
  ItemModel({
    this.expanded = false,
    required this.headerItem,
    required this.itens,
  });
}
