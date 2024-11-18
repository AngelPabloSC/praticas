import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import '../widgets/widget_botton.dart';
import '../widgets/widget_fields.dart';

class PageAhorroMeta extends StatefulWidget {
  const PageAhorroMeta({super.key});

  @override
  _PageAhorroMetaState createState() => _PageAhorroMetaState();
}
bool mostrarContavalues = true;
class _PageAhorroMetaState extends State<PageAhorroMeta> {
  int? selectedNumber;
  TextEditingController monto=TextEditingController();
  bool mostrarContavalues = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Abrir AhorroMeta",
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: Color.lerp(Colors.blueAccent, Colors.blueAccent, 200),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            item1(
                'Puedes cancelar Tu ahorro en cualquier momento.' 'El monto minimo mesual es de \$ 10'
            ),
            const SizedBox(height: 40.0),
             InputField(

              title: 'Monto mensual de ahorro',
              hintText: 'Ingrese monto',
                keyboardType: 
                const TextInputType.numberWithOptions( decimal: true),
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow("[n0-9.,]")
                //
                // ],
               controller: monto,

            ),
            const SizedBox(height: 20.0),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text('Elije el plazo de tu ahorro meses'),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: itemListTypes(),
                 ),
                 const SizedBox(height: 20.0),
                   contaPresent(),
                   contavalues(),
                 const SizedBox(height: 250.0),
                 const BtnC(
                   title: "Continuar",
                 )
               ],

             ),
          ],
        ),
      ),
    );
  }

  Widget item1(String text) {
    return Card(
      color: const Color(0xffe9f7ff),
      margin: const EdgeInsets.all(1.10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.circle_notifications, size: 40),
            const SizedBox(width: 15),
            Flexible(
              child: Text(text, overflow: TextOverflow.visible),
            )
          ],
        ),
      ),
    );
  }


  Widget contaPresent() {
    return const SizedBox(
      height: 160,
      width: 390.0,
      child: Card(
        color:Color(0xFFF4F5FF),
        margin: EdgeInsets.all(20.30),
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                    child:
                    Column(
                      children: [
                        Text("Monto final de ahorro",
                        style:TextStyle(
                          color: Color(0xFF7177CC),
                        ),),
                        const SizedBox(height: 10.0),
                        Text("\$00",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:FontWeight.bold,
                        ),),
                        const SizedBox(height: 10.0),
                        Text("tasa efecticva: 0% en 0 meses"),
                      ],
                    ),
                )
              ],
            )
        ),
      ),
    );
  }

  Widget contavalues() {
    return const Column(
      children: [
         SizedBox(
          height: 160,
          width: 390.0,
          child: Card(
            color:Color(0xFFF4F5FF),
            margin: EdgeInsets.all(20.30),
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child:
                      Column(
                        children: [
                          Text("Monto final de ahorro",
                            style:TextStyle(
                              color: Color(0xFF7177CC),
                            ),),
                          const SizedBox(height: 10.0),
                          Text("\$00",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight:FontWeight.bold,
                            ),),
                          const SizedBox(height: 10.0),
                          Text(": 0% en 0 meses"),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),

        ),
        Text("Revisa la tabla de ahorros proyectados",
        style: TextStyle(
          color:Color(0xff30379F)
        ),),
      ],
    );
  }


  Widget itemListValues({
    required List<int> list,
    required int? value,
    required ValueChanged<int?> onChanged,
  }) {
    List<int> listAux = [...list, -1];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listAux.map((e) {
          bool isActive = value == e;
          bool isOther = e == -1;
          var title = e.toString();
          if (isOther) title = 'Otro';
          var index = listAux.indexOf(value ?? -2);
          if (isOther && value != null && index < 0) {
            title = value.toString();
            isActive = true;
          }
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: BtnC(
              title: title,
              inverseWithBorder: !isActive,
              width: null,
              isExpanded: false,
              colorBorderSide: Colors.grey,
              rightChild: isOther && isActive
                  ? const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.edit,
                  size: 18.0,
                  color: Colors.white,
                ),
              )
                  : null,
              textStyle: isActive ? null : const TextStyle(color: Colors.grey),
              onTap: () async {
                onChanged(e);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget itemListTypes() {
    List<int> list = [3, 6, 12];
    return itemListValues(
      list: list,
      value: selectedNumber,
      onChanged: (e) {
        setState(() {
          selectedNumber = e;
        });
      },
    );
  }

}
