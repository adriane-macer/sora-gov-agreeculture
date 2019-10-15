import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_event.dart';
import 'package:sora_gov_agree/blocs/my_farm_bloc/my_farm_state.dart';

class MyFarmBloc extends Bloc<MyFarmEvent, MyFarmState> {
  @override
  MyFarmState get initialState => MyFarmUninitialized();

  @override
  Stream<MyFarmState> mapEventToState(MyFarmEvent event) async* {
    if (event is FetchMyFarm) {
      yield MyFarmLoading();
      //TODO implement code
      await Future.delayed(Duration(seconds: 2));
      yield MyFarmLoaded();
    }
  }
}
