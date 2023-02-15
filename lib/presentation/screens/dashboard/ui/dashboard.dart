import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_refresh/Presentation/components/spacers.dart';
import 'package:pull_refresh/business_logic/bloc/dashboard/bloc/dashboard_bloc.dart';
import 'package:pull_refresh/presentation/components/loader.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, required this.title, required this.username})
      : super(key: key);

  final String title;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {
            if (state is DashboardNav) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is DashboardLoading) {
              return LoadingWidget(child: initialLayout(context));
            } else {
              return initialLayout(context)aas;
            }
          },
        ));
  }

  Widget initialLayout(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "hai $username!",
              style: const TextStyle(fontSize: 50.00, color: Colors.black),
            ),
            const HeightSpacer(myHeight: 10.00),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<DashboardBloc>(context).add(NavBack());
                },
                child: const Text("Back"))
          ],
        ),
      );
}
