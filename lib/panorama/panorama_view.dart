import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class Panorama extends StatelessWidget {
  const Panorama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PanoramaViewer(
         
          child: Image.asset(
            'assets/360.jpg',
            height: 100,
            width: 200,
          )
        ),
      ),
    );
  }
}