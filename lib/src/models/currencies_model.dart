import 'dart:convert';

class CurrenciesModel {
  String? src;
  String? title;
  String? rate;
  CurrenciesModel({
    this.src,
    this.title,
    this.rate,
  });



  CurrenciesModel copyWith({
    String? src,
    String? title,
    String? rate,
  }) {
    return CurrenciesModel(
      src: src ?? this.src,
      title: title ?? this.title,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(src != null){
      result.addAll({'src': src});
    }
    if(title != null){
      result.addAll({'title': title});
    }
    if(rate != null){
      result.addAll({'rate': rate});
    }
  
    return result;
  }

  factory CurrenciesModel.fromMap(Map<String, dynamic> map) {
    return CurrenciesModel(
      src: map['src'],
      title: map['title'],
      rate: map['rate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrenciesModel.fromJson(String source) => CurrenciesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CurrenciesModel(src: $src, title: $title, rate: $rate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CurrenciesModel &&
      other.src == src &&
      other.title == title &&
      other.rate == rate;
  }

  @override
  int get hashCode => src.hashCode ^ title.hashCode ^ rate.hashCode;
}
