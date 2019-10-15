import 'package:flutter/material.dart';
import 'package:sora_gov_agree/pages/harvest_page.dart';
import 'package:sora_gov_agree/pages/plants_page.dart';

class _DrawerItem {
  IconData icon;
  String title;

  _DrawerItem(this.icon, this.title);
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  final drawerItems = [
    _DrawerItem(
      Icons.local_florist,
      "My plants",
    ),
    _DrawerItem(Icons.restaurant, "My Harvest"),
    _DrawerItem(Icons.attach_money, "Crop Prices"),
    _DrawerItem(Icons.help_outline, "Help"),
    _DrawerItem(Icons.language, "Tagalog"),
    _DrawerItem(Icons.language, "English"),
    _DrawerItem(Icons.settings, "Settings"),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _drawerSelectedIndex = 0;
  String title = "Home";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return PlantsPage();
      case 1:
        return HarvestPage();
      default:
        return Center(child: new Text("Not yet available"));
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _drawerSelectedIndex = index;

      title = widget.drawerItems[index].title;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _drawerSelectedIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      drawer: Drawer(
        child: new Column(
          children: <Widget>[Column(children: drawerOptions)],
        ),
      ),
      body: _getDrawerItemWidget(_drawerSelectedIndex),
    );
  }
}
