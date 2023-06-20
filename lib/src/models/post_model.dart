// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostModel {
  String? title;
  String? description;
  String? userId;
  String? avatar;
  List<dynamic>? tags;
  PostModel({
    this.title,
    this.description,
    this.userId,
    this.avatar,
    this.tags,
  });

  PostModel copyWith({
    String? title,
    String? description,
    String? userId,
    String? avatar,
    List<String>? tags,
  }) {
    return PostModel(
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      avatar: avatar ?? this.avatar,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'userId': userId,
      'avatar': avatar,
      'tags': tags,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      tags: map['tag'] != null ? List<dynamic>.from((map['tag'] as List<dynamic>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(title: $title, description: $description, userId: $userId, avatar: $avatar, tags: $tags)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.userId == userId &&
      other.avatar == avatar &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      userId.hashCode ^
      avatar.hashCode ^
      tags.hashCode;
  }
}
