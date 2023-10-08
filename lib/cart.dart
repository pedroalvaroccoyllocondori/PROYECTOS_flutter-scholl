import 'package:flutter/material.dart';

class CardItem {
  final String image;
  final String name;
  final double price;

  CardItem({required this.image, required this.name, required this.price});
}

class CardCarousel extends StatelessWidget {
  final List<CardItem> cards = [
    CardItem(
        image:
            'https://polleriaslagranja.com/wp-content/uploads/2022/10/La-Granja-Real-Food-Chicken-1.4-de-Pollo-a-la-Brasa.png',
        name: 'POLLO A LA BRASA',
        price: 20),
    CardItem(
        image:
            'https://www.divinacocina.es/wp-content/uploads/2023/05/arroz-chaufa-peruano-v-1.jpg',
        name: 'ARROZ CHAUFA',
        price: 15),
    CardItem(
        image:
            'https://d33wubrfki0l68.cloudfront.net/0d8efece3c1478eac53966918ff9e28511c5ba90/d0375/images/uploads/2022_07_18_lomo_saltado_0.jpg',
        name: 'LOMO SALTADO',
        price: 15),
    CardItem(
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO7Stf3UwlYjw4j8rnf4_bWP40gFVlqnrrrg&usqp=CAU',
        name: 'MOSTRITO',
        price: 21),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.network(cards[index].image, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cards[index].name,
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '\S/.${cards[index].price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16.0, color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
