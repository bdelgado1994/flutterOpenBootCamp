import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String? title;
  const MyHomePage({super.key, this.title});

  @override
  State<StatefulWidget> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomePage> {
  bool favorite = true;
  int currentIndex = 0;

  String? centerText;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? material() : cupertino();
  }

  Widget material() {
    Icon icon = !favorite
        ? const Icon(Icons.favorite)
        : const Icon(Icons.favorite_outline);
    // TODO: implement build
    String labelTextFloating = favorite == true ? 'Liked' : 'Unliked';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: favorite ? Colors.red : Colors.blue,
          title: Text(widget.title!.toString()),
          actions: [
            IconButton(onPressed: onChageFavorite, icon: icon),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: const [
              DrawerHeader(
                child: Text(
                  'Menu Drawer',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text('Enlace 1'),
              Text('Enlace 2'),
              Text('Enlace 3'),
              Text('Enlace 4'),
              Text('Enlace 5'),
            ],
          ),
        ),
        body: Center(
          child: Text(
            centerText == null ? 'Estas en el Home' : centerText!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: onChageFavorite,
          backgroundColor: favorite ? Colors.red : Colors.blue,
          icon: icon,
          label: Text(labelTextFloating),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (value) => onTapNavigationBar(value),
          backgroundColor: favorite ? Colors.red : Colors.blue,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: 'Cuenta',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assessment,
                color: Colors.white,
              ),
              label: 'Estadistica',
            ),
          ],
        ));
  }

  Widget cupertino() {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        middle: Text(
          'Titulo de Pagina',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          'aplicacion Barra de Navegacion',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void onTapNavigationBar(int index) {
    switch (index) {
      case 0:
        currentIndex = index;
        centerText = 'Estas en el Home';
        break;
      case 1:
        currentIndex = index;
        centerText = 'Estas en Cuenta';
        break;
      case 2:
        currentIndex = index;
        centerText = 'Estas en Estadistica';
        break;
    }
    setState(() {});
  }

  void onChageFavorite() => setState(() => favorite = !favorite);
}


/************************************ */
/*class _MyHomeAppState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        middle: Text(
          'Titulo de Pagina',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          'aplicacion Barra de Navegacion',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}*/
/***********************************************************************/
//Bottom Navigation BarCUpertino
/*class _MyHomeAppState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(backgroundColor: Colors.red, items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), label: 'Inicio'),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, color: Colors.white),
            label: 'Mi cuenta'),
        BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.white), label: 'Estadisticas'),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [Text('$index: Inicio')],
                  ),
                ),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [Text('$index: Mi Cuenta')],
                  ),
                ),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [Text('$index: Estadisticas')],
                  ),
                ),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Center(
                  child: Column(
                    children: [Text('$index: Mi Cuenta')],
                  ),
                ),
              );
            });
        }
      },
    );
  }
}*/

