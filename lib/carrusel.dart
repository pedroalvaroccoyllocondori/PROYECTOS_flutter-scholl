import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'products.dart'; // Importa la clase Product

class ProductCarouselPage extends StatefulWidget {
  @override
  _ProductCarouselPageState createState() => _ProductCarouselPageState();
}

class _ProductCarouselPageState extends State<ProductCarouselPage> {
  List<Product> products = [
    Product(
        name: "POLLO A LA BRASA",
        description:
            "Nuestro pollo a la brasa es una obra maestra culinaria, preparada con cuidado y perfección. Comenzamos con pollo fresco de la más alta calidad, marinado con una mezcla secreta de especias que se ha perfeccionado durante generaciones. Este proceso de marinado se combina con el calor uniforme de nuestras brasas de carbón, creando una piel crujiente y dorada que encierra los jugos y sabores deliciosos en cada mordisco",
        imageUrl: "images/pollo_brasa.jpg"),
    Product(
        name: "ARROS CHAUFA",
        description:
            "Nuestro Arroz Chaufa es un tributo a la riqueza de la cultura gastronómica peruana. Comenzamos con los ingredientes más frescos y los woks tradicionales, donde se combinan magistralmente sabores y texturas. Nuestros chefs expertos dominan la técnica de saltear, creando un platillo donde el arroz se mezcla con trozos de pollo jugoso, camarones tiernos, verduras frescas y un toque de huevo",
        imageUrl: "images/chaufa.jpg"),
    Product(
        name: "LOMO SALTADO",
        description:
            "Descubre el inigualable Lomo Saltado, una explosión de sabores que fusiona la tradición peruana y china en un solo plato. Nuestra receta exclusiva combina tiernos trozos de carne marinada con vegetales frescos, todo salteado a fuego alto para un toque crujiente y servido con arroz al vapor. Los aromas y especias se entrelazan en cada bocado, ofreciendo una experiencia gastronómica única que satisfará tus sentidos y te llevará a un viaje culinario que no querrás olvidar",
        imageUrl: "images/lomo.jpg"),
    // Agrega más productos aquí
  ];

  int _currentIndex = 0;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/welcome.jpg'), // Cambia esto por la ruta de tu imagen de fondo
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   margin: const EdgeInsets.all(10.0),
              //   padding: const EdgeInsets.all(10.0),
              //   width: double.infinity,
              //   height: 80,
              //   color: Colors.grey,
              //   child: const Center(
              //     child: Text("SELECCIONE UN PRODUCTO",
              //         style: TextStyle(color: Colors.white, fontSize: 18.0)),
              //   ),
              // ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(179, 175, 175, 175),
                    labelText: 'Buscar Producto',
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: products
                    .where((product) =>
                        _searchText.isEmpty ||
                        product.name
                            .toLowerCase()
                            .contains(_searchText.toLowerCase()))
                    .map((product) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                product.imageUrl,
                                width: 300,
                                height: 300,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
              Container(
                color: Colors.grey,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Text(
                  'Producto actual: ${products[_currentIndex].name}',
                  style: const TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              Container(
                  color: Colors.grey,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: Text(
                    'Descripccion actual: ${products[_currentIndex].description}',
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
