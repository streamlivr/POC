// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NetworkModel {
  String? title;
  String? src;
  NetworkModel({
    this.title,
    this.src,
  });

  NetworkModel copyWith({
    String? title,
    String? src,
  }) {
    return NetworkModel(
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

  factory NetworkModel.fromMap(Map<String, dynamic> map) {
    return NetworkModel(
      title: map['title'] != null ? map['title'] as String : null,
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkModel.fromJson(String source) => NetworkModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NetworkModel(title: $title, src: $src)';

  @override
  bool operator ==(covariant NetworkModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.src == src;
  }

  @override
  int get hashCode => title.hashCode ^ src.hashCode;
}
