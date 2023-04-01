import 'package:kisiler_uygulamasi_dio/model/kisiler.dart';

class KisilerCevap {
  List<Kisiler> kisiler;
  int success;
  KisilerCevap(this.kisiler, this.success);

  factory KisilerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json['kisiler'] as List;
    List<Kisiler> kisiler = jsonArray
        .map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi))
        .toList();
    return KisilerCevap(kisiler, json['success'] as int);
  }
}
