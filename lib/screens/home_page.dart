import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterInitial>(
            builder: (context, state) {
              return Text(state.counterValue.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBtn(() {
                // log("subd");
                BlocProvider.of<CounterCubit>(context).decrement();
              }, "Sub"),
              buildBtn(() {
                // log("adds");
                BlocProvider.of<CounterCubit>(context).increment();
              }, "Add"),
            ],
          )
        ],
      ),
    );
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
