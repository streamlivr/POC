// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StreamModel {
  String? title;
  String? description;
  String? userId;
  String? userName;
  String? streamId;
  String? streamImage;
  String? avatar;
  StreamModel({
    this.title,
    this.description,
    this.userId,
    this.userName,
    this.streamId,
    this.streamImage,
    this.avatar,
  });

  StreamModel copyWith({
    String? title,
    String? description,
    String? userId,
    String? userName,
    String? streamId,
    String? streamImage,
    String? avatar,
  }) {
    return StreamModel(
      title: title ?? this.title,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      streamId: streamId ?? this.streamId,
      streamImage: streamImage ?? this.streamImage,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'userId': userId,
      'userName': userName,
      'streamId': streamId,
      'streamImage': streamImage,
      'avatar': avatar,
    };
  }

  factory StreamModel.fromMap(Map<String, dynamic> map) {
    return StreamModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      userName:
          map['userName'] != null ? map['userName'] as String : null,
      streamId: map['streamId'] != null ? map['streamId'] as String : null,
      streamImage:
          map['streamImage'] != null ? map['streamImage'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StreamModel.fromJson(String source) =>
      StreamModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(title: $title, description: $description, userId: $userId, usernameId: $userName, streamId: $streamId, streamImage: $streamImage, avatar: $avatar)';
  }

  @override
  bool operator ==(covariant StreamModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.userId == userId &&
        other.userName == userName &&
        other.streamId == streamId &&
        other.streamImage == streamImage &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        streamId.hashCode ^
        streamImage.hashCode ^
        avatar.hashCode;
  }
}
