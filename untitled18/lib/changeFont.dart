import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontPickerPage extends StatelessWidget {
  final TextStyle? currentFontStyle;

  const FontPickerPage({super.key, this.currentFontStyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Font Seçimi")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              TextStyle newFont = GoogleFonts.lato(textStyle: const TextStyle(fontSize: 20));
              Navigator.pop(context, newFont);
            },
            child: const Text("Lato Fontunu Seç"),
          ),
          ElevatedButton(
            onPressed: () {
              TextStyle newFont = GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 20));
              Navigator.pop(context, newFont);
            },
            child: const Text("Roboto Fontunu Seç"),
          ),
        ],
      ),
    );
  }
}
