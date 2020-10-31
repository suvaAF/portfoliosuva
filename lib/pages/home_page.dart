import 'package:flutter/material.dart';
import 'package:portfoliosuva/config/assets.dart';
import 'package:portfoliosuva/tabs/about_tab.dart';
import 'package:portfoliosuva/tabs/blog_tab.dart';
import 'package:portfoliosuva/tabs/projects_tab.dart';
import 'package:portfoliosuva/widgets/theme_inherited_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  int _selectedIndex = 0;
  static List<Widget> tabWidgets = <Widget>[
    AboutTab(),
    BlogTab(),
    ProjectsTab(),
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: ThemeSwitcher.of(context).isDarkModeOn?Icon(Icons.wb_sunny):Image.asset(Assets.moon,height: 20,width: 20,),
            onPressed: ()=> ThemeSwitcher.of(context).switchDarkMode(),
          )
        ],
      ),
      body: Center(
        child: tabWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('A Propos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            title: Text('Blog'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share),
            title: Text('Projets'),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index)=> setState(() => _selectedIndex = index),
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }

}