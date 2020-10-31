import 'package:flutter/material.dart';
import 'package:portfoliosuva/pages/home_page.dart';
import 'package:portfoliosuva/widgets/theme_inherited_widget.dart';

import 'config/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return ThemeSwitcherWidget(
    initialDarkModeOn: false,
    child: Suva(),
  );
}
}
class Suva extends StatelessWidget {
  const Suva({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Souvannarith CHEA',
      theme:ThemeSwitcher.of(context).isDarkModeOn?darkTheme(context):lightTheme(context),
      home: HomePage(),
    );
  }
}
