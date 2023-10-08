import 'package:flutter/material.dart';
import 'package:primera_app/carrusel.dart';
import 'package:primera_app/pagina_pedidos.dart';

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
  List<Widget> paginas = [const ProductCarouselPage(), PaginaPedidos()];
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
        backgroundColor: const Color.fromARGB(122, 251, 137, 103),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.restaurant_menu_outlined, color: Colors.white),
              label: "PRODUCTOS"),
          NavigationDestination(
              icon: Icon(Icons.sell_outlined, color: Colors.white),
              label: "PEDIDOS")
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
