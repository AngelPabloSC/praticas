import 'package:flutter/material.dart';

class ItemGrid extends StatelessWidget {
  const ItemGrid(
      {super.key, required this.text, required this.icon, this.onTap});

  final String text;
  final IconData icon;
  final Function? onTap;

  // final VoidCallback? onTap1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
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
      ),
    );
    ;
  }
}

class GridItemNum extends StatefulWidget {
  final int number;
  final bool isSelected;
  final VoidCallback onTap;

  const GridItemNum({
    Key? key,
    required this.number,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _GridItemNumState createState() => _GridItemNumState();
}

class _GridItemNumState extends State<GridItemNum> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: widget.isSelected ? Colors.blue : Colors.white,
        child: Center(
          child: Text(
            widget.number.toString(),
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}





class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  DateTime? now;
  int? value;

  @override
  void initState() {
    super.initState();
    now = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemGrid(
          text: "Hola",
          icon: Icons.add,
          onTap: () {
            setState(() {
              value = 2;
            });
          },
        )
      ],
    );
  }
}
