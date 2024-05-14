import 'package:flutter/material.dart';

class Soru {
  String soruMetni;
  bool dogruCevap;
  double? dogruSonuc;

  Soru({required this.soruMetni, required this.dogruCevap, this.dogruSonuc});
}

class TestData {
  int _soruIndex = 0;

  List<Soru> sorular = [
    Soru(soruMetni: '11 * 11 = ?', dogruCevap: true, dogruSonuc: 121),
    Soru(soruMetni: '11 * 11 * 11 =  ?', dogruCevap: true, dogruSonuc: 1331),
    Soru(soruMetni: '1 + 2 * 3 - 4 =  ?', dogruCevap: true, dogruSonuc: 3),
    Soru(
        soruMetni: '10 * 10 * 10 * 0 * 10 =  ?',
        dogruCevap: true,
        dogruSonuc: 0),
    Soru(
        soruMetni: '2017 * 2017 + 2017 =  ?',
        dogruCevap: true,
        dogruSonuc: 4068306),
    Soru(soruMetni: '2 * 2 + 2 / 2 =  ?', dogruCevap: true, dogruSonuc: 5),
    Soru(
        soruMetni: '1 + 0.1 + 0.001 =  ?', dogruCevap: true, dogruSonuc: 1.101),
    Soru(
        soruMetni: '5x + 3 = 7x – 1 = x in değeri kaçtır?',
        dogruCevap: true,
        dogruSonuc: 2),
    Soru(soruMetni: '2 nin %20 si kaçtır?', dogruCevap: true, dogruSonuc: 0.4),
    Soru(
        soruMetni: '5(y + 1) = 3(y + 2) + 11 = y nin değeri kaçtır?',
        dogruCevap: true,
        dogruSonuc: 6),
  ];

  String soruMetni() {
    return sorular[_soruIndex].soruMetni;
  }

  bool soruCevabi() {
    return sorular[_soruIndex].dogruCevap;
  }

  double? soruSonucu() {
    return sorular[_soruIndex].dogruSonuc;
  }

  void cevapKontrol(bool cevap) {
    if (cevap == soruCevabi()) {
      cevapAnahtari.add(
        Text(
          '✔️',
          style: TextStyle(
            color: Colors.green,
            fontSize: 20.0,
          ),
        ),
      );
    } else {
      cevapAnahtari.add(
        Text(
          '❌',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
          ),
        ),
      );
    }
    _soruIndex++;
  }

  void testiYenidenBaslat() {
    _soruIndex = 0;
    cevapAnahtari
        .clear(); // Test yeniden başlatıldığında cevap anahtarlarını temizle
  }

  List<Widget> cevapAnahtari = [];
}
