import 'package:flutter/material.dart';
import 'package:pull_refresh/Presentation/components/spacers.dart';

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
        body: initialLayout(context));
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
            ElevatedButton(onPressed: () {}, child: const Text("Back"))
          ],
        ),
      );
}
