  import 'package:flutter/material.dart';
  import 'package:praticas/page/widget/item_grid.dart';

  import 'AhorroMeta.dart';

  class PageHome extends StatefulWidget {
    const PageHome({super.key});

    @override
    State<PageHome> createState() => _PageHomeState();
  }

  class _PageHomeState extends State<PageHome> {
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(height: 40.0),
          Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  itemAccount(0.78, "Cuenta ahorros12"),
                  itemAccount(0.23, "Cuenta 2"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: <Widget>[
                  ItemGrid(text: 'Test', icon: Icons.add_chart_sharp, onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageAhorroMeta()),
                    );
                  }),
                  ItemGrid(text: 'v', icon: Icons.cabin),
                  ItemGrid(text:'c', icon:Icons.cabin),
                  ItemGrid(text:'d',icon: Icons.cabin),
                  // Agrega más elementos con iconos aquí
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget itemAccount(double amount, String title) {
      return Container(
        height: 250,
        width: 350.0,
        child: Card(
          shadowColor: Colors.pink,
          elevation: 5,
          margin: EdgeInsets.all(20.30),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.star, size: 14),
                    SizedBox(width: 2.0),
                    Text(
                      'Cuenta ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Saldo Disponible'),
                          Text(
                            '\$${amount}',
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Cuenta de ahorro',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }



    Widget itemGrid(String text, IconData icon) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 60), // Agregar el icono aquí
            Text(text),
          ],
        ),
      );
    }
  }

