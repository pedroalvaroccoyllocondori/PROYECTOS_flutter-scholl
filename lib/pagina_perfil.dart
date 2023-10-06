import 'package:flutter/material.dart';

const int itemcontador = 20;

class PaginaPerfil extends StatelessWidget {
  const PaginaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemcontador,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('item ${(index + 1)}'),
            leading: const Icon(Icons.pets_rounded),
            trailing: const Icon(Icons.select_all),
            onTap: () {
              debugPrint('item ${(index + 1)} selecionado');
            },
          );
        });
  }
}
