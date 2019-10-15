import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_bloc.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_event.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_bloc.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_event.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_event.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_event.dart';
import 'package:sora_gov_agree/pages/crop_prices_page/crop_prices_page.dart';
import 'package:sora_gov_agree/pages/harvest_page/harvest_page.dart';
import 'package:sora_gov_agree/pages/help_page/help_page.dart';
import 'package:sora_gov_agree/pages/my_farm_page/my_farm_page.dart';
import 'package:sora_gov_agree/pages/plants_page/plants_page.dart';

class _DrawerItem {
  IconData icon;
  String title;

  _DrawerItem(this.icon, this.title);
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  final drawerItems = [
    _DrawerItem(Icons.home, "My Farm"),
    _DrawerItem(Icons.local_florist, "My plants"),
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
  String title;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return BlocProvider<MyFarmBloc>(
            builder: (context) =>
            MyFarmBloc()
              ..dispatch(FetchMyFarm()),
            child: MyFarmPage());
      case 1:
        return BlocProvider<PlantsBloc>(
            builder: (context) =>
            PlantsBloc()
              ..dispatch(FetchPlants()),
            child: PlantsPage());
      case 2:
        return BlocProvider<HarvestBloc>(
            builder: (context) =>
            HarvestBloc()
              ..dispatch(FetchHarvest()),
            child: HarvestPage());
      case 3:
        return BlocProvider<CropPricesBloc>(
            builder: (context) =>
            CropPricesBloc()
              ..dispatch(FetchCropPrices()),
            child: CropPricesPage());
      case 4:
        return HelpPage();
      default:
        return Center(child: new Text("Not yet available"));
    }
  }

  @override
  void initState() {
    super.initState();
    title = "${widget.drawerItems[0].title}";
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
