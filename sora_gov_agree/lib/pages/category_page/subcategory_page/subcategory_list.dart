import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/subcategory_bloc/subcategory_bloc.dart';
import 'package:sora_gov_agree/models/subcategory.dart';

class SubcategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Subcategory> list =
        BlocProvider.of<SubcategoryBloc>(context).subcategories;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            "Name: ${list[index].name}",
          ),
          subtitle: Text("Symbol: ${list[index].symbol}"),
        );
      },
      itemCount: list.length,
    );
  }
}
