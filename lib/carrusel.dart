import 'package:flutter/material.dart';
import 'package:primera_app/cart.dart';

class ProductCarouselPage extends StatelessWidget {
  const ProductCarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/welcome.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(179, 175, 175, 175),
                    labelText: 'Buscar',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              Expanded(child: CardCarousel())
            ]));
  }
}
