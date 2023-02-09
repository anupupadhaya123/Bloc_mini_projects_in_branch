import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/business_logic/cubit/age_calculator_cubit.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.calculateBtnFocusNode,
      required this.ageController})
      : super(key: key);

  final FocusNode calculateBtnFocusNode;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      focusNode: calculateBtnFocusNode,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 1),
        minimumSize: const Size(175, 50),
      ),
      onPressed: () {
        try {
          BlocProvider.of<AgeCalculatorCubit>(context)
              .updateageVal(int.parse(ageController.text));
        } catch (ex) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please enter your age")));
        }
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('Calculate'),
    );
  }
}
