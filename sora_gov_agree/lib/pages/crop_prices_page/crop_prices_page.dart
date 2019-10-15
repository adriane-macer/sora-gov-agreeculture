import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_bloc.dart';
import 'package:sora_gov_agree/blocs/crop_prices_bloc/crop_prices_state.dart';
import 'package:sora_gov_agree/pages/crop_prices_page/crop_prices_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class CropPricesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CropPricesBloc, CropPricesState>(
      builder: (context, state) {
        if(state is CropPricesLoading || state is CropPricesUninitialized)
          return Scaffold(body: LoadingIndicator());
        if(state is CropPricesLoaded){
          return CropPricesScreen();
        }
        if(state is CropPricesError)
          {
            return Scaffold(body: Text("Something went wrong"));
          }
        if(state is NoCropPricesLoaded)
          {
            return Scaffold(body: Text("No CropPrices Loaded"));
          }
        return Container();
      },
    );
  }
}
