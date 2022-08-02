import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class voiture extends StatefulWidget {
  const voiture({Key? key}) : super(key: key);

  @override
  State<voiture> createState() => _voitureState();
}

class _voitureState extends State<voiture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 11, 174, 224),
            Color.fromARGB(255, 81, 96, 232)
          ])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Voiture',
              style: GoogleFonts.abel(fontSize: 24),
            ),
          ),
          body: Center(
            child: Text(
              'Hello',
              style: GoogleFonts.abel(fontSize: 70),
            ),
          )),
    );
  }
}
