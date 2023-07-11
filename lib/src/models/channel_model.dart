import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChannelModel {
  String? title;
  String? channelId;
  String? image;
  String? userId;
  String? followers;
  List<String>? tag;
  ChannelModel({
    this.title,
    this.channelId,
    this.image,
    this.userId,
    this.followers,
    this.tag,
  });

  ChannelModel copyWith({
    String? title,
    String? channelId,
    String? image,
    String? userId,
    String? followers,
    List<String>? tag,
  }) {
    return ChannelModel(
      title: title ?? this.title,
      channelId: channelId ?? this.channelId,
      image: image ?? this.image,
      userId: userId ?? this.userId,
      followers: followers ?? this.followers,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(title != null){
      result.addAll({'title': title});
    }
    if(channelId != null){
      result.addAll({'channelId': channelId});
    }
    if(image != null){
      result.addAll({'image': image});
    }
    if(userId != null){
      result.addAll({'userId': userId});
    }
    if(followers != null){
      result.addAll({'followers': followers});
    }
    if(tag != null){
      result.addAll({'tag': tag});
    }
  
    return result;
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      title: map['title'],
      channelId: map['channelId'],
      image: map['image'],
      userId: map['userId'],
      followers: map['followers'],
      tag: List<String>.from(map['tag']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelModel.fromJson(String source) => ChannelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChannelModel(title: $title, channelId: $channelId, image: $image, userId: $userId, followers: $followers, tag: $tag)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChannelModel &&
      other.title == title &&
      other.channelId == channelId &&
      other.image == image &&
      other.userId == userId &&
      other.followers == followers &&
      listEquals(other.tag, tag);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      channelId.hashCode ^
      image.hashCode ^
      userId.hashCode ^
      followers.hashCode ^
      tag.hashCode;
  }
}
