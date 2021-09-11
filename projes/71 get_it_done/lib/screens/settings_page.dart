import 'package:flutter/material.dart';
import 'package:get_it_done/models/theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({Key? key}) : super(key: key);

  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  late bool _value = true;
  @override
  Widget build(BuildContext context) {
    Text greenText = Text(
      "Yeşil",
      style: TextStyle(
        color: Colors.green,
      ),
    );

    Text redText = Text(
      "Kırmızı",
      style: TextStyle(
        color: Colors.red,
      ),
    );

    return Card(
      child: SwitchListTile(
        title: Text(
          "Tema rengini değiştir",
          style: TextStyle(color: Colors.black),
        ),
        subtitle: _value ? greenText : redText,
        value: _value,
        onChanged: (bool value) {
          setState(() {
            _value = value;
            Provider.of<ColorThemeData>(context, listen: false)
                .switchTheme(_value);
          });
        },
      ),
    );
  }
}
