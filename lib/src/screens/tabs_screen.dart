import 'package:flutter/material.dart';


class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
          )
        ],
      )
   );
  }
}