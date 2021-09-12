import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final int index;

  ItemCard({required this.title, required this.isDone, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        Provider.of<ItemData>(context, listen: false).deleteItem(index);
      },
      child: Card(
        color: isDone ? Colors.grey.shade200 : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              Provider.of<ItemData>(context, listen: false).toggleStatus(index);
            },
            value: isDone,
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
