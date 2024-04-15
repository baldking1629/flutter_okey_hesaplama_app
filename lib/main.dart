import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

bool isDarkMode = true;
late Icon themeIcon;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: isDarkMode
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      home: homeScreen(),
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  Scaffold homeScreen() {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(CupertinoIcons.lightbulb_fill)
                : const Icon(CupertinoIcons.lightbulb_slash_fill),
            onPressed: () {
              setState(() {
                theme();
              });
            },
          )
        ],
        title: const Text('Okey Hesaplama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    elBilgisi(okeysayi),
                    style: GoogleFonts.notoSansBuginese(fontSize: 28),
                  ),
                  Text(
                    okeysayi.toString(),
                    style: TextStyle(fontSize: 36),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    'Per',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: okeyTaslari(true),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    'Yan',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: okeyTaslari(false),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  okeysayi = 0;
                })
              },
              child: const Text('Sıfırla'),
            ),
          ],
        ),
      ),
    );
  }

  String elBilgisi(int okeySayi) {
    if (okeysayi >= 101) {
      return 'Açar';
    } else {
      return 'Açmaz';
    }
  }

  int okeysayi = 0;
  int okey_sayi_hesapla_per(int okey_sayi) {
    okeysayi = okeysayi + (okey_sayi * 3);
    return okeysayi;
  }

  int okey_sayi_hesapla_yan(int okey_sayi) {
    okeysayi = okeysayi + okey_sayi;
    return okeysayi;
  }

  List<Widget> okeyTaslari(bool perMi) {
    return [
      for (var i = 1; i < 14; i++)
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: 55,
            height: 80,
            child: Ink(
              color: Color.fromARGB(255, 163, 162, 162),
              child: InkWell(
                splashColor: Colors.black,
                onTap: () {
                  if (perMi) {
                    setState(() {});
                    okey_sayi_hesapla_per(i);
                  } else {
                    setState(() {});
                    okey_sayi_hesapla_yan(i);
                  }
                },
                child: Container(
                  width: 45,
                  height: 70,
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    '$i\n.',
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 0.6,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    ];
  }

  void theme() {
    if (isDarkMode) {
      isDarkMode = false;
      themeIcon = const Icon(CupertinoIcons.lightbulb);
    } else {
      isDarkMode = true;
      themeIcon = const Icon(CupertinoIcons.lightbulb_slash_fill);
    }
  }
}
