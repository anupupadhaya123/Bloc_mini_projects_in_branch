import 'package:bloc/bloc.dart';

part 'age_calculator_state.dart';

class AgeCalculatorCubit extends Cubit<AgeCalculator> {
  AgeCalculatorCubit() : super(AgeCalculatorInitial());

  void updateAgeVal(String ageVal) async {
    if (ageVal.toString().isEmpty) {
      emit(AgeCalculatorError());
    } else {
      emit(AgeCalculatorLoading());
      await Future.delayed(const Duration(seconds: 3), () {
        emit(AgeCalculatorLoaded(ageVal.toString()));
      });
    }
  }

  String getAge(int ageVal) {
    if (ageVal == 0 || ageVal == 1) {
      return "Infant";
    } else if (ageVal >= 2 && ageVal <= 4) {
      return "Todlers";
    } else if (ageVal >= 5 && ageVal <= 12) {
      return "Child";
    } else if (ageVal >= 13 && ageVal <= 19) {
      return "Teen";
    } else if (ageVal >= 20 && ageVal <= 39) {
      return "Adult";
    } else if (ageVal >= 40 && ageVal <= 59) {
      return "Middle Age Adult";
    } else {
      return "Senior Adult";
    }
  }
}
