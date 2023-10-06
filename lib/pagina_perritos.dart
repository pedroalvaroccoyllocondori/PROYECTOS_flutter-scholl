import 'package:flutter/material.dart';

class PaginaPerritos extends StatefulWidget {
  const PaginaPerritos({super.key});

  @override
  State<PaginaPerritos> createState() => _PaginaPerritosState();
}

class _PaginaPerritosState extends State<PaginaPerritos> {
  bool esteInterruptor = false;
  bool? estaChequeado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("perritos"),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("se presiono el action del appbar");
              },
              icon: const Icon(Icons.pets))
        ],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/perrito.jpg'),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.deepOrange,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              color: Colors.deepOrange,
              child: const Center(
                child: Text("este es un textWidget",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      esteInterruptor ? Colors.amberAccent : Colors.orange),
              onPressed: () {
                debugPrint("presiono el elbated button");
              },
              child: const Text("boton elevador"),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("presiono el outlined");
              },
              child: const Text("boton outlined"),
            ),
            TextButton(
              onPressed: () {
                debugPrint("presiono el textbutton");
              },
              child: const Text("boton textbutton"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                debugPrint("este es el widget row");
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.local_activity,
                    color: Colors.amberAccent,
                  ),
                  Text("hola mundo"),
                  Icon(Icons.access_alarm,
                      color: Color.fromARGB(237, 50, 92, 243)),
                ],
              ),
            ),
            Switch(
                value: esteInterruptor,
                onChanged: (bool nuevoBoleano) {
                  setState(() {
                    esteInterruptor = nuevoBoleano;
                  });
                }),
            Checkbox(
                value: estaChequeado,
                onChanged: (bool? nuevoBoleano) {
                  setState(() {
                    estaChequeado = nuevoBoleano;
                  });
                }),
            Image.network(
                'https://t1.ea.ltmcdn.com/es/razas/7/4/7/schnocker_747_0_600.jpg')
          ],
        ),
      ),
    );
  }
}
