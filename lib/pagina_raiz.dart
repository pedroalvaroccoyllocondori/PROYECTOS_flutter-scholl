import 'package:flutter/material.dart';
import 'package:primera_app/carrusel.dart';
import 'package:primera_app/pagina_perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PaginaRaiz(),
      theme: ThemeData(primarySwatch: Colors.deepOrange),
    );
  }
}

class PaginaRaiz extends StatefulWidget {
  const PaginaRaiz({super.key});

  @override
  State<PaginaRaiz> createState() => _PaginaRaizState();
}

class _PaginaRaizState extends State<PaginaRaiz> {
  int paginaActual = 0;
  List<Widget> paginas = [ProductCarouselPage(), PaginaPerfil()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[paginaActual],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("boton");
        },
        child: const Icon(Icons.add_business_sharp),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.restaurant_menu_outlined), label: "PRODUCTOS"),
          NavigationDestination(
              icon: Icon(Icons.sell_outlined), label: "PEDIDOS")
        ],
        onDestinationSelected: (int index) {
          setState(() {
            paginaActual = index;
          });
        },
        selectedIndex: paginaActual,
      ),
    );
  }
}
