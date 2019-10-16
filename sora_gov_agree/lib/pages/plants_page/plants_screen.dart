import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_bloc.dart';
import 'package:sora_gov_agree/models/crop.dart';

class PlantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Crop> _crops = BlocProvider.of<PlantsBloc>(context).crops;
    return ListView.builder(
      itemCount: _crops.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 120.0,
            child: ListTile(
              title: Text(
                "${_crops[index].name}",
              ),
              subtitle: Text("${_crops[index].measure}"),
            ),
          ),
        );
      },
    );
  }
}
