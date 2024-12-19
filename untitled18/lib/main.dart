import 'package:flutter/material.dart';
import 'package:untitled18/changeFont.dart';
import 'package:untitled18/colorSelect.dart';
import 'package:untitled18/date.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle fontStyle = GoogleFonts.poppins(fontSize: 20);
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcı Bilgisi'),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                    'assets/WhatsApp Image 2024-12-12 at 12.40.14.jpeg'),
              ),
              const SizedBox(height: 20),
              Text(
                'Faruk Biberoğlu',
                style: fontStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Text(
                '22',
                style: fontStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  // Font seçimi yapılacak sayfaya git
                  final selectedFont = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FontPickerPage(currentFontStyle: fontStyle),
                    ),
                  );
                  if (selectedFont != null) {
                    setState(() {
                      fontStyle = selectedFont;
                    });
                  }
                },
                child: const Text(
                  'Fontu Değiştir',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DatePickerPage()), // Tarih seçici sayfasına yönlendir
                  );
                },
                child: const Text('DataPicker',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              ),
              ElevatedButton(
                onPressed: () async {
                  final selectedColor = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ColorPickerPage(currentColor: backgroundColor),
                    ),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      backgroundColor = selectedColor;
                    });
                  }
                },
                child: const Text(
                  'Arka Plan Rengini Değiştir',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
