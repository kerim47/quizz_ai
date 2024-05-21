class Quiz {
  List<Soru> sorular;

  Quiz({required this.sorular});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var soruList = json['sorular'] as List;
    List<Soru> sorular = soruList.map((soru) => Soru.fromJson(soru)).toList();

    return Quiz(sorular: sorular);
  }
}

class Soru {
  String soru;
  List<String> secenekler;
  String cevap;

  Soru({
    required this.soru,
    required this.secenekler,
    required this.cevap,
  });

  factory Soru.fromJson(Map<String, dynamic> json) {
    return Soru(
      soru: json['soru'],
      secenekler: List<String>.from(json['secenekler']),
      cevap: json['cevap'],
    );
  }
}
