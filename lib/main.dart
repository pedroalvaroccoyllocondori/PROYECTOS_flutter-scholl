import 'package:flutter/material.dart';
import 'package:primera_app/pagina_hogar.dart';
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
  List<Widget> paginas = const [PaginaHogar(), PaginaPerfil()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[paginaActual],
      appBar: AppBar(
        title: const Text("Tienda de Perritos shar pei"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("boton");
        },
        child: const Icon(Icons.add_business_sharp),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "hogar"),
          NavigationDestination(icon: Icon(Icons.pets), label: "perfil")
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
