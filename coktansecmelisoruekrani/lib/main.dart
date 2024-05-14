import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Flutter materyal kütüphanesini içe aktarır.
import 'dart:math'; // Matematiksel işlemler yapabilmek için gerekli kütüphaneyi içe aktarır.
import 'sorular.dart'; // "sorular.dart" dosyasından TestData sınıfını içe aktarır.

void main() {
  runApp(const MyApp()); // Uygulamayı başlatır.
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() =>
      _MyAppState(); // MyApp sınıfının durumunu tutan _MyAppState sınıfını oluşturur.
}

class _MyAppState extends State<MyApp> {
  TestData testData = TestData(); // TestData sınıfından bir nesne oluşturur.
  late int
      dogrucevapindex; // Doğru cevabın dizinini tutacak değişkeni tanımlar.

  @override
  void initState() {
    super.initState();
    dogrucevapindex = Random()
        .nextInt(4); // Başlangıçta rastgele bir doğru cevap dizini belirler.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Başlık Kısmı
        appBar: AppBar(
          // Üst orta kısma başlık eklemek için AppBar kullandım.
          title: const Text(
            "MATEMATİK QUİZ SINAVI ", // Başlık olarak "MATEMATİK QUİZ SINAVI " yazdım.
          ),
          centerTitle: true, // Başlığın ortalanması için
          backgroundColor:
              Colors.grey, // AppBar'ın arka plan rengi beyaz olarak ayarlandı
        ),

        //Arkaplan kısmı

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/images/arkaplan.jpg"), // Arka plan resminin yolunu belirtin
              fit: BoxFit.cover, // Resmi doldurma modu
            ),
          ),

          //Soruların Metin Kısmı
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Expanded(
                    flex:
                        3, // genişlik ve yüksekliği diğer widgetlara göre ayarlamak için kullanılır.
                    child: Center(
                      child: Text(
                        testData.soruMetni(), // Soru metnini ekrana yazdırır.
                        style: TextStyle(
                            fontSize: 30.0, // Yazı stili belirler.
                            color:
                                Colors.white), //Yazı arkaplan rengini belirler
                      ),
                    ),
                  ),

                  //Buton Kısmı

                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () =>
                                    sorusonucu(dogrucevapindex == 0),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // Buton arka plan rengi
                                  minimumSize: Size(100, 50), // Buton boyutu
                                ),
                                child: Text(
                                  'A) ${dogrucevapindex == 0 ? testData.soruSonucu()?.toString() : rastgeleyanliscevap().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  // Butona basıldığında yapılacak işlemler
                                  sorusonucu(dogrucevapindex == 1);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // Buton arka plan rengi
                                  minimumSize: Size(100, 50), // Buton boyutu
                                ),
                                child: Text(
                                  'B) ${dogrucevapindex == 1 ? testData.soruSonucu()?.toString() : rastgeleyanliscevap().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  // Butona basıldığında yapılacak işlemler
                                  sorusonucu(dogrucevapindex == 2);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // Buton arka plan rengi
                                  minimumSize: Size(100, 50), // Buton boyutu
                                ),
                                child: Text(
                                  'C) ${dogrucevapindex == 2 ? testData.soruSonucu()?.toString() : rastgeleyanliscevap().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  // Butona basıldığında yapılacak işlemler
                                  sorusonucu(dogrucevapindex == 3);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Colors.blue, // Buton arka plan rengi
                                  minimumSize: Size(200, 50), // Buton boyutu
                                ),
                                child: Text(
                                  'D) ${dogrucevapindex == 3 ? testData.soruSonucu()?.toString() : rastgeleyanliscevap().toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Cevap Anahtarı Kısmı

                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: testData
                            .cevapAnahtari, // Cevap anahtarını ekrana yazdırır.
                      ),
                    ),
                  ),

                  // Quizi Yeniden Başlat Butonu Kısmı

                  ElevatedButton(
                    onPressed: () {
                      testData.testiYenidenBaslat(); // Testi yeniden başlatır.
                      testData.cevapAnahtari
                          .clear(); // Cevap anahtarını temizler.
                      setState(() {
                        dogrucevapindex = Random().nextInt(
                            4); // Yeniden rastgele bir doğru cevap dizini belirler.
                      });
                    },
                    child: Text(
                        'Testi Yeniden Başlat'), // Butonun üzerindeki metni belirler.
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sorusonucu(bool dogru) {
    testData.cevapAnahtari.clear(); // Cevap anahtarını temizler.
    testData.cevapKontrol(dogru); // Cevabı kontrol eder.
    if (dogru) {
      testData.cevapAnahtari.add(
        Text(
          'Doğru', // Doğruysa "Doğru" yazısını ekler.
          style: TextStyle(
            color: Colors.green, // Yeşil renkte yazdırır.
            fontSize: 20.0,
          ),
        ),
      );
    } else {
      testData.cevapAnahtari.add(
        Text(
          'Yanlış', // Yanlışsa "Yanlış" yazısını ekler.
          style: TextStyle(
            color: Colors.red, // Kırmızı renkte yazdırır.
            fontSize: 20.0,
          ),
        ),
      );
    }
    setState(() {
      testData.cevapAnahtari.length =
          1; // Cevap anahtarının uzunluğunu 1 yapar.
      dogrucevapindex =
          Random().nextInt(4); // Rastgele bir doğru cevap dizini belirler.
    });
  }

  //Rastgele cevap kısmı

  int rastgeleyanliscevap() {
    Random random = Random();
    return random
        .nextInt(200); // 0 ile 199 arasında rastgele bir sayı döndürür.
  }
}
