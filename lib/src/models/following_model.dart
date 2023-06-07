// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FollowingModel {
  String? title;
  String? views;
  String? src;
  FollowingModel({
    this.title,
    this.views,
    this.src,
  });

  FollowingModel copyWith({
    String? title,
    String? views,
    String? src,
  }) {
    return FollowingModel(
      title: title ?? this.title,
      views: views ?? this.views,
      src: src ?? this.src,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'views': views,
      'src': src,
    };
  }

  factory FollowingModel.fromMap(Map<String, dynamic> map) {
    return FollowingModel(
      title: map['title'] != null ? map['title'] as String : null,
      views: map['views'] != null ? map['views'] as String : null,
      src: map['src'] != null ? map['src'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowingModel.fromJson(String source) => FollowingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FollowingModel(title: $title, views: $views, src: $src)';

  @override
  bool operator ==(covariant FollowingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.views == views &&
      other.src == src;
  }

  @override
  int get hashCode => title.hashCode ^ views.hashCode ^ src.hashCode;
}
