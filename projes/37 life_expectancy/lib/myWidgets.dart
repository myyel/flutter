import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData fontIcon;
  final String yazi;

  IconCinsiyet({required this.fontIcon, required this.yazi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontIcon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          yazi,
          style: kTittleText,
        )
      ],
    );
  }
}

class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  var onPress;

  MyContainer({
    this.renk = Colors.white,
    this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: renk,
        ),
      ),
    );
  }
}

class SliderColumn extends StatefulWidget {
  double deger = 0;
  String soru = "";
  int degerMax = 0;
  int degerMin = 0;

  SliderColumn(
      {required this.soru, required this.degerMax, required this.degerMin});
  @override
  _SliderColumnState createState() =>
      _SliderColumnState(degerMax: degerMax, degerMin: degerMin, soru: soru);
}

class _SliderColumnState extends State<SliderColumn> {
  double deger = 0;
  String soru = "";
  int degerMax = 0;
  int degerMin = 0;

  _SliderColumnState(
      {required this.soru, required this.degerMax, required this.degerMin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          soru,
          style: kTittleText,
        ),
        Text(
          deger.round().toString(),
          style: kContentText,
        ),
        Slider(
          value: deger,
          onChanged: (double _newCigarette) {
            setState(() {
              deger = _newCigarette;
            });
          },
          min: degerMin.toDouble(),
          max: degerMax.toDouble(),
        ),
      ],
    );
  }
}
