class Item {
  String title = "";
  bool isDone;

  Item({required this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }
}
