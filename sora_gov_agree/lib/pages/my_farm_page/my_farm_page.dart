
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_state.dart';
import 'package:sora_gov_agree/pages/my_farm_page/my_farm_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';



class MyFarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFarmBloc, MyFarmState>(
      builder: (context, state) {
        if(state is MyFarmLoading || state is MyFarmUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is MyFarmLoaded){
          return MyFarmScreen();
        }
        if(state is MyFarmError)
          {
            return Scaffold(body: Text( "Something went wrong"));
          }
        if(state is NoMyFarmLoaded)
          {
            return Scaffold(body: Text( "No item"));
          }
        return Container();
      },
    );
  }
}