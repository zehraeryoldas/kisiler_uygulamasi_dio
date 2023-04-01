//repo da amacım veri tabanında kayıt yapmak
// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi_dio/model/kisiler.dart';
import 'package:kisiler_uygulamasi_dio/model/kisiler_cevap.dart';

class KisilerRepository {
  List<Kisiler> parseKisilerCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kisiKayit(String ad, int kisiTel) async {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {'kisi_ad': ad, "kisi_tel": kisiTel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Ekle : ${cevap.data.toString()}");
  }

  Future<void> guncelle(int kisiId, String kisiAd, String kisiTel) async {
     var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {'kisi_id':kisiId,'kisi_ad': kisiAd, "kisi_tel": kisiTel};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi Güncelle : ${cevap.data.toString()}");
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {'kisi_ad': aramaKelimesi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseKisilerCevap(cevap.data.toString());
  }

  Future<void> kisiSil(int kisiId) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {'kisi_id': kisiId};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("Kişi sil : ${cevap.data.toString()}");
  }
}
