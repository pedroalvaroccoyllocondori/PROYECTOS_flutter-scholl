import 'package:flutter/material.dart';
import 'package:primera_app/pagina_perritos.dart';

class PaginaHogar extends StatelessWidget {
  const PaginaHogar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const PaginaPerritos();
            }),
          );
        },
        child: const Text("pagina Hogar"),
      ),
    );
  }
}
