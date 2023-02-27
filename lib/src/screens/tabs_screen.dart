import 'package:flutter/material.dart';


class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
   );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Para Ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados'
        )
      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
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
    );
  }
}