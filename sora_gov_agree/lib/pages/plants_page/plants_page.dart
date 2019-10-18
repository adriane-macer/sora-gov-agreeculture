import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_state.dart';
import 'package:sora_gov_agree/pages/plants_page/plants_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class PlantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlantsBloc, PlantsState>(
      builder: (context, state) {
        if(state is PlantsLoading || state is PlantsUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is PlantsLoaded){
          return PlantsScreen();
        }
        if(state is PlantsError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoPlantsLoaded)
          {
            return Scaffold(body: Text("No Data"));
          }
        return Container();
      },
    );
  }
}
