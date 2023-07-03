import 'package:flutter/material.dart';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02, left: 25, right: 25),
      children: const [
        // --- FIRST SECTION --- [Used Photos]
        
        // --- Second SECTION --- [Our Offerings]
        
        // --- ADVERTISEMENT ---
        
        // --- Third SECTION --- [x]
        
        // --- Fourth SECTION --- [x]
        
        // --- Fifth SECTION --- [Youtube]
        
        // --- Sixth SECTION --- [PTA Tax]

        // --- ADVERTISEMENT ---
      ],
    );
    ;
  }
}
