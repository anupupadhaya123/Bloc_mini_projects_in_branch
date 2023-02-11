// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'age_calculator_cubit.dart';

abstract class AgeCalculator {}

class AgeCalculatorInitial extends AgeCalculator {}

class AgeCalculatorLoading extends AgeCalculator {}

class AgeCalculatorLoaded extends AgeCalculator {
  final String stageOfLife;

  AgeCalculatorLoaded(this.stageOfLife);
}

class AgeCalculatorError extends AgeCalculator {}
