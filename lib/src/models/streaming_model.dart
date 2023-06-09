// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StreamingModel {
  String? title;
  String? avatar;
  String? image;
  String? subtitle;
  String? userName;
  String? views;
  List<String>? tag;
  StreamingModel({
    this.title,
    this.avatar,
    this.image,
    this.subtitle,
    this.userName,
    this.views,
    this.tag,
  });

  StreamingModel copyWith({
    String? title,
    String? avatar,
    String? image,
    String? subtitle,
    String? userName,
    String? views,
    List<String>? tag,
  }) {
    return StreamingModel(
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      image: image ?? this.image,
      subtitle: subtitle ?? this.subtitle,
      userName: userName ?? this.userName,
      views: views ?? this.views,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'avatar': avatar,
      'image': image,
      'subtitle': subtitle,
      'userName': userName,
      'views': views,
      'tag': tag,
    };
  }

  factory StreamingModel.fromMap(Map<String, dynamic> map) {
    return StreamingModel(
      title: map['title'] != null ? map['title'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      views: map['views'] != null ? map['views'] as String : null,
      // tag: map['tag'] != null ? List<String>.from((map['tag'] as List<String>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamingModel.fromJson(String source) => StreamingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StreamingModel(title: $title, avatar: $avatar, image: $image, subtitle: $subtitle, userName: $userName, views: $views, tag: $tag)';
  }

  @override
  bool operator ==(covariant StreamingModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.avatar == avatar &&
      other.image == image &&
      other.subtitle == subtitle &&
      other.userName == userName &&
      other.views == views &&
      listEquals(other.tag, tag);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      avatar.hashCode ^
      image.hashCode ^
      subtitle.hashCode ^
      userName.hashCode ^
      views.hashCode ^
      tag.hashCode;
  }
}
