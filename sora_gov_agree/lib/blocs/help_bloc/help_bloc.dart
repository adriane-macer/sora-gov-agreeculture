import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/help_bloc/help_event.dart';
import 'package:sora_gov_agree/blocs/help_bloc/help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  @override
  HelpState get initialState => HelpUninitialized();

  @override
  Stream<HelpState> mapEventToState(HelpEvent event) async* {
    if(event is FetchHelp) {
      yield HelpLoading();
      //TODO implement code
      await Future.delayed((Duration(seconds: 3)));
      yield HelpLoaded();
    }
  }
}
