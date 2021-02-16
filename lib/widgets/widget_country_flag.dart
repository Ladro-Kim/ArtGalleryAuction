import 'package:flutter/material.dart';

class CountryFlag extends StatefulWidget {
  String country;
  int size; // 16, 24, 32, 48, 64

  CountryFlag({@required this.country, @required this.size});

  @override
  _CountryFlagState createState() => _CountryFlagState();
}

class _CountryFlagState extends State<CountryFlag> {
  @override
  Widget build(BuildContext context) {
    return Image.network('https://www.countryflags.io/${widget.country}/shiny/${widget.size}.png');
  }
}
