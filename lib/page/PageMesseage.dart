import 'package:flutter/material.dart';

import '../controller/controller.dart';
import '../models/prueba.dart';


class PageMessage extends StatefulWidget {
  const PageMessage({super.key});

  @override
  State<PageMessage> createState() => _PageMessageState();
}

class _PageMessageState extends State<PageMessage> {
  List<Photo> photos = [];

  var offset = 0;
  var limit = 40;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      var prueba = await Controller().getPosts(offset, limit);
      photos = prueba?.photos ?? [];
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, i) {
              var e = photos[i];
              return itemsColumn("${e.id} - ${e.title}", e.description, e.url);
            },
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)),
            onPressed: () async {
              var limitof = photos.length;
              if (offset >= limitof) {
                print("LLogo al limite");
              } else {
                offset = limit + offset;
              }
              var pruebaAux = await Controller().getPosts(offset, limit);
              if (pruebaAux != null) photos.addAll(pruebaAux.photos);
              setState(() {
                // refrescar
              });
            },
            child: const Text("Carga"))
      ],
    );
  }

  Widget itemsColumn(String text, String description, String imageurl) {
    return Container(
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        // color: Colors.black,//
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              imageurl,
              width: 400,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber)),
                      onPressed: () {},
                      child: const Text("Ver mas"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
