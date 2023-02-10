import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  SampleCubit() : super(SampleInitial());

  Future<void> displayData(String data) async {
    emit(SampleLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      data.isNotEmpty ? emit(SampleLoaded(data)) : emit(SampleErro());
    });
  }

  Future<void> restartState() async {
    emit(SampleLoading());
    await Future.delayed(const Duration(seconds: 3), () {
      emit(SampleInitial());
    });
  }
}
