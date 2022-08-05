import 'package:app/Screens/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Avion extends StatefulWidget {
  const Avion({Key? key}) : super(key: key);

  @override
  State<Avion> createState() => _AvionState();
}

class _AvionState extends State<Avion> {
  final depController = TextEditingController();
  final desController = TextEditingController();
  String dropdownvalue = 'Airbus 319';
  double _value = 6;
  // List of items in our dropdown menu
  var items = [
    'Airbus 320',
    'Airbus 330',
    'Airbus 319',
    'Boeing 737',
    'Boeing 777',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 11, 174, 224),
            Color.fromARGB(255, 255, 255, 255)
          ])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Avion',
              style: GoogleFonts.abel(fontSize: 24),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Text(
                  'Choisir aeroports',
                  style: GoogleFonts.abel(fontSize: 50),
                ),
                /*  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: depController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.airplane_ticket),
                        border: InputBorder.none,
                        labelText: 'Airport',
                        hintText: 'Depart'),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: desController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.airplane_ticket, color: Colors.green),
                        border: InputBorder.none,
                        labelText: 'Airport',
                        hintText: 'Destination'),
                  ),
                ), */
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Modèle d\'avion',
                      style: GoogleFonts.abel(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                      dropdownColor: Colors.blue,

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text('Distance', style: GoogleFonts.abel(fontSize: 24)),
                    SizedBox(
                      width: 5,
                    ),
                    Slider(
                      min: 0.0,
                      max: 20000.0,
                      value: _value,
                      divisions: 100,
                      label: '${_value.round()}',
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle:
                        const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Result()),
                    );
                  },
                  child:
                      Text('Calculer', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )),
    );
  }

  void Calculer() {
    if (desController.text.isNotEmpty && depController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Result()),
      );
      print('$_value');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Veuillez remplir tous les champs")));
      print('empty');
    }
  }
}
