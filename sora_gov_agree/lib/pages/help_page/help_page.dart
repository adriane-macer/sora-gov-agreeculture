import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sora_gov_agree/blocs/help_bloc/help_bloc.dart';
import 'package:sora_gov_agree/blocs/help_bloc/help_state.dart';
import 'package:sora_gov_agree/pages/help_page/help_screen.dart';
import 'package:sora_gov_agree/widgets/loading_indicator.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpBloc, HelpState>(
      builder: (context, state) {
        if (state is HelpLoading || state is HelpUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is HelpLoaded) {
          return HelpScreen();
        }
        if (state is HelpError) {
          return Scaffold(body: Text("Something went wrong"));
        }
        if (state is NoHelpLoaded) {
          return Scaffold(body: Text("No Help Loaded"));
        }
        return Container();
      },
    );
  }
}
