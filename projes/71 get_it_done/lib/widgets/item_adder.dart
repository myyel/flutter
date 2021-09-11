import 'package:flutter/material.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                controller: textController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Görev Ekle",
                  hintText: "...",
                ),
                autofocus: true,
              ),
            ),
            FlatButton(
              onPressed: () {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(textController.text);
                Navigator.pop(context);
              },
              child: Text(
                "Ekle",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
