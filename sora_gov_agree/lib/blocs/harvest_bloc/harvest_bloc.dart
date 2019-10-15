import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_event.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_state.dart';

class HarvestBloc extends Bloc<HarvestEvent, HarvestState> {
  @override
  HarvestState get initialState => HarvestUninitialized();

  @override
  Stream<HarvestState> mapEventToState(HarvestEvent event) async* {
    if(event is FetchHarvest) {
      yield HarvestLoading();
      //TODO implement code
      await Future.delayed((Duration(seconds: 3)));
      yield HarvestLoaded();
    }
  }
}