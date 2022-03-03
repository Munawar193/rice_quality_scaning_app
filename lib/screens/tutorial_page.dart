import 'package:flutter/material.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget videoPlayer() {
      return Container(
        margin: const EdgeInsets.only(
          top: 90,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kprimeColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(4.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(-4.0, -4.0),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
            ),
          )
        ]),
      );
    }

    return Scaffold(
        backgroundColor: kprimeColor,
        body: Column(
          children: [
            videoPlayer(),
          ],
        ));
  }
}
