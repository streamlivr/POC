// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WalletModel {
  String? title;
  String? src;
  WalletModel({
    this.title,
    this.src,
  });


  WalletModel copyWith({
    String? title,
    String? src,
  }) {
    return WalletModel(
      title: title ?? this.title,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'src': src,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      title: map['title'] != null ? map['title'] as String : null,
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) => WalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WalletModel(title: $title, src: $src)';

  @override
  bool operator ==(covariant WalletModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.src == src;
  }

  @override
  int get hashCode => title.hashCode ^ src.hashCode;
}
