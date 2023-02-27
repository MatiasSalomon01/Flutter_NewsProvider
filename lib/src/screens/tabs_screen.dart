import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
       ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (value) => navegacionModel.paginaActual = value,
      selectedItemColor: Colors.red.withOpacity(0.7),
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

class _NavegacionModel extends ChangeNotifier{
  int _paginaActual = 0;

  int get paginaActual =>  _paginaActual;

  set paginaActual(int valor){
    _paginaActual = valor;
    notifyListeners();
  }
}