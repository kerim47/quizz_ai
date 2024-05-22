class Question {
  List<Sorular>? sorular;

  Question({this.sorular});

  Question.fromJson(Map<String, dynamic> json) {
    if (json['sorular'] != null) {
      sorular = <Sorular>[];
      json['sorular'].forEach((v) {
        sorular!.add(Sorular.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sorular != null) {
      data['sorular'] = sorular!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sorular {
  String? soru;
  List<String>? secenekler;
  String? cevap;

  Sorular({this.soru, this.secenekler, this.cevap});

  Sorular.fromJson(Map<String, dynamic> json) {
    soru = json['soru'];
    secenekler = json['secenekler'].cast<String>();
    cevap = json['cevap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['soru'] = soru;
    data['secenekler'] = secenekler;
    data['cevap'] = cevap;
    return data;
  }
}
