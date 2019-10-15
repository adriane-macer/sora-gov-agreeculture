import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_event.dart';
import 'package:sora_gov_agree/blocs/harvest_bloc/harvest_state.dart';

class HarvestBloc extends Bloc<HarvestEvent, HarvestState> {
  @override
  HarvestState get initialState => HarvestUninitialized();

  @override
  Stream<HarvestState> mapEventToState(HarvestEvent event) async* {
    //TODO implement code
  }
}