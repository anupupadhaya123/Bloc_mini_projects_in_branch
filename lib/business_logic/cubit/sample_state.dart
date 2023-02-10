part of 'sample_cubit.dart';

@immutable
abstract class SampleState {}

class SampleInitial extends SampleState {}

class SampleLoading extends SampleState {}

class SampleLoaded extends SampleState {
  final String textMsg;

  SampleLoaded(this.textMsg);
}

class SampleErro extends SampleState {}
