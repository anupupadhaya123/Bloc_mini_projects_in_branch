import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/business_logic/cubit/age_calculator_cubit.dart';
import 'package:pull_refresh/presentation/components/height_spacer.dart';
import 'package:pull_refresh/presentation/screens/widgets/button_widget.dart';
import 'package:pull_refresh/presentation/screens/widgets/input_field.dart';
import 'package:pull_refresh/presentation/screens/widgets/text_date.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode calculateBtnFocusNode;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    calculateBtnFocusNode = FocusNode();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    calculateBtnFocusNode.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AgeCalculatorCubit, AgeCalculatorInitial>(
                builder: (context, state) {
                  return TextData(message: state.stageOfLife);
                },
              ),
              const HeightSpacer(myHeight: 20),
              InputField(
                focusNode: calculateBtnFocusNode,
                ageController: ageController,
              ),
              const HeightSpacer(myHeight: 20),
              ButtonWidget(
                  calculateBtnFocusNode: calculateBtnFocusNode,
                  ageController: ageController)
            ],
          ),
        ));
  }

  Widget buildBtn(Function myTap, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          myTap();
        },
        child: Text(text),
      ),
    );
  }
}
