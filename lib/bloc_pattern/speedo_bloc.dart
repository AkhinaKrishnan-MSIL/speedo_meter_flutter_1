import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_event.dart';
import 'package:speedo_meter_flutter/bloc_pattern/speedo_state.dart';

class SpeedoBloc extends Bloc<SpeedoEvent, SpeedoState> {
  int speedoeventValue;

  SpeedoBloc({required this.speedoeventValue})
      :super(SpeedmeterState(speedmetervalue: 0)) {
    on<SpeedoEvent>((event, emit) {
      print('event ---> ${speedoeventValue} ');
      if (event is ClickEvent) {
        emit(SpeedmeterState(speedmetervalue:event.SpeedoeventValue ));
      }
    });
  }
}
