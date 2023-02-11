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
        child: BlocConsumer<AgeCalculatorCubit, AgeCalculator>(
          listener: (context, state) {
            if (state is AgeCalculatorError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is AgeCalculatorLoading) {
              return buildLoading();
            } else if (state is AgeCalculatorLoaded) {
              return buildLoadedInput(state.stageOfLife);
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextData(message: ":)"),
          const HeightSpacer(myHeight: 20),
          InputField(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
          const HeightSpacer(myHeight: 10),
          ButtonWidget(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
        ],
      );

  Widget buildLoading() =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        WidthSpacer(myWidth: 25.50),
        Text("Loading..."),
      ]);

  Widget buildLoadedInput(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextData(message: data),
          const HeightSpacer(myHeight: 20),
          InputField(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
          const HeightSpacer(myHeight: 10),
          ButtonWidget(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
        ],
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your age!'),
        ),
      );
}
