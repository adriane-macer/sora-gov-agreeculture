import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_event.dart';
import 'package:sora_gov_agree/blocs/plants_bloc/plants_state.dart';
import 'package:sora_gov_agree/models/crop.dart';
import 'package:sora_gov_agree/services/plants_service.dart';
import 'package:sora_gov_agree/services/service_locator.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState> {
  List<Crop> _crops = [];

  List<Crop> get crops => _crops;

  @override
  PlantsState get initialState => PlantsUninitialized();

  @override
  Stream<PlantsState> mapEventToState(PlantsEvent event) async* {
    if (event is FetchPlants) {
      yield PlantsLoading();
      try {
        _crops = await locator<PlantsService>().getData();
        yield PlantsLoaded();
      } catch (e) {
        print(e);
        yield PlantsError(Exception("Fetching plants error."));
      }
    }
  }
}
