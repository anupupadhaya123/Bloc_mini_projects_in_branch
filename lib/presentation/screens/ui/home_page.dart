import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/presentation/components/height_spacer.dart';
import 'package:pull_refresh/presentation/screens/Widgets/text_field.dart';

import '../../../business_logic/cubit/sample_cubit.dart';
import '../widgets/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: BlocBuilder<SampleCubit, SampleState>(
        builder: (context, state) {
          if (state is SampleInitial) {
            return buildInitialLayout();
          } else if (state is SampleLoading) {
            return buildLoading();
          } else if (state is SampleLoaded) {
            return buildLoadedLayout(state.textMsg);
          } else {
            return buildErrorLayout();
          }
        },
      )),
    );
  }

  Widget buildInitialLayout() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputField(textEditingController: _textEditingController),
          const HeightSpacer(myHeight: 15.00),
          BtnWidget(
            txtData: "Submit",
            myFunction: () {
              log(_textEditingController.text.toString());
              submitData(_textEditingController.text);
            },
          )
        ],
      );

  Widget buildLoading() => const CircularProgressIndicator();

  Widget buildLoadedLayout(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hai $data"),
          const HeightSpacer(myHeight: 15.00),
          BtnWidget(
            txtData: "Back",
            myFunction: () {
              navBack();
            },
          )
        ],
      );

  Widget buildErrorLayout() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Something went wrong! Missing name!!"),
          const HeightSpacer(myHeight: 15.00),
          BtnWidget(
            txtData: "Back",
            myFunction: () {
              navBack();
            },
          )
        ],
      );

  void submitData(String data) {
    BlocProvider.of<SampleCubit>(context).displayData(data);
  }

  void navBack() {
    BlocProvider.of<SampleCubit>(context).restartState();
  }
}
