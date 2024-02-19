import 'package:basketball/consts.dart';
import 'package:flutter/material.dart';

class LoadingMatchCard extends StatelessWidget {
  const LoadingMatchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 12,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: kGrey43,
                  borderRadius: BorderRadius.only(
                      topLeft: kBorderRadius, bottomLeft: kBorderRadius)),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                  color: kGrey34,
                  borderRadius: BorderRadius.only(
                      topRight: kBorderRadius, bottomRight: kBorderRadius)),
              child: const Center(child: Text('123')),
            )
          ],
        ));
  }
}
