import 'package:flutter/material.dart';

const List<String> pedidosPeruanos = [
  'Ceviche de pescado',
  'Lomo saltado',
  'Ají de gallina',
  'Causa rellena',
  'Anticuchos',
  'Arroz con pollo',
  'Tacu Tacu con mariscos',
  'Rocoto relleno',
  'Papa a la huancaína',
  'Suspiro a la limeña',
  // Agrega más platos peruanos aquí
];

class PaginaPedidos extends StatelessWidget {
  const PaginaPedidos({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pedidosPeruanos.length,
      itemBuilder: (BuildContext context, int index) {
        final pedido = pedidosPeruanos[index];
        return ListTile(
          title: Text(pedido),
          leading: const Icon(Icons.restaurant_menu),
          trailing: const Icon(Icons.shopping_cart),
          onTap: () {
            debugPrint('$pedido seleccionado');
            // Aquí puedes realizar alguna acción cuando se seleccione un pedido
          },
        );
      },
    );
  }
}
