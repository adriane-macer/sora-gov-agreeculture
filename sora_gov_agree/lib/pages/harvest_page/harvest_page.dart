import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_bloc.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_state.dart';
import 'package:sora_gov_agree/pages/harvest_page/harvest_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class HarvestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HarvestBloc, HarvestState>(
      builder: (context, state) {
        if (state is HarvestLoading || state is HarvestUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is HarvestLoaded) {
          return HarvestScreen();
        }
        if (state is HarvestError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoHarvestLoaded) {
          return Scaffold(body: Text("No Harvest Loaded"));
        }
        return Container();
      },
    );
  }
}
