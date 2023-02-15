import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/business_logic/bloc/homepage_bloc.dart';
import 'package:pull_refresh/presentation/components/shimmer.dart';

import '../../data/models/homepage_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomepageLoaded) {
            return buildLoadedLayout(state.data);
          } else if (state is HomepageLoading) {
            return buildLoadingLayout();
          } else {
            return buildInitialLayout(context);
          }
        },
      ),
    );
  }

  Widget buildInitialLayout(BuildContext context) => Center(
        child: ElevatedButton(
            onPressed: () =>
                BlocProvider.of<HomepageBloc>(context).add(LoadData()),
            child: const Text("Load Data")),
      );

  Widget buildLoadingLayout() => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return const ShimmerWidget();
      });

  Widget buildLoadedLayout(List<HomepageModel> data) => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index].name.toString()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<HomepageBloc>(context).add(NavBack()),
                child: const Text("Back")),
          )
        ],
      );
}
