import 'package:flutter/material.dart';

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data; //  ThemeSwitcher pour accéder à l'état actuel de ThemeSwitcherWidget

  const ThemeSwitcher({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) { //Cette méthode retourne l'état actuel du ThemeSwitcherWidget. Cela sera utilisé dans l'arbre
    return (context.inheritFromWidgetOfExactType(ThemeSwitcher)
    as ThemeSwitcher)
        .data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher old) {
    return this != old;
  }
}

class ThemeSwitcherWidget extends StatefulWidget {
  final bool initialDarkModeOn; // C'est l'état initial de la variable
  final Widget child; // L'enfant pour cette variable booléenne qui doit être diffusé lors du changement. Ce sera notre application dans ce cas

  ThemeSwitcherWidget({Key key, this.initialDarkModeOn, this.child})
      : assert(initialDarkModeOn != null),
        assert(child != null),
        super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}


class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool isDarkModeOn;

  void switchDarkMode() {  // La méthode utilisée pour basculer en mode sombre pendant l'exécution de l'application
    setState(() {
      isDarkModeOn = !isDarkModeOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkModeOn = isDarkModeOn ?? widget.initialDarkModeOn; // c'est la méthode de construction de l'arborescence des widgets avec les informations ci-dessus
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}