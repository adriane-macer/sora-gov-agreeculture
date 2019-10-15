import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_event.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_state.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  @override
  PlantsState get initialState => PlantsUninitialized();

  @override
  Stream<PlantsState> mapEventToState(PlantsEvent event) async* {
    if(event is FetchPlants) {
      yield PlantsLoading();
      //TODO implement code
      await Future.delayed(Duration(seconds: 3));
      yield PlantsLoaded();
    }
  }
}


