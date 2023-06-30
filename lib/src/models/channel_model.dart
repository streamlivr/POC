// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChannelModel {
  String? title;
  String? image;
  ChannelModel({
    this.title,
    this.image,
  });

  ChannelModel copyWith({
    String? title,
    String? image,
  }) {
    return ChannelModel(
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }

  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      title: map['title'] != null ? map['title'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChannelModel.fromJson(String source) => ChannelModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenreModel(title: $title, image: $image)';

  @override
  bool operator ==(covariant ChannelModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode;
}
