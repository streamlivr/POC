import 'dart:convert';

class AllChannelModel {
  String? channelId;
  String? channelName;
  String? channelDescription;
  String? channelImage;
  String? channelStatus;
  String? channelType;
  String? channelCreatedDate;
  String? channelUpdatedDate;
  String? channelOwner;
  String? channelFollowing;
  String? channelFollowers;
  String? totalViews;
  String? totalLikes;
  String? totalDislikes;
  String? totalDownloads;
  AllChannelModel({
    this.channelId,
    this.channelName,
    this.channelDescription,
    this.channelImage,
    this.channelStatus,
    this.channelType,
    this.channelCreatedDate,
    this.channelUpdatedDate,
    this.channelOwner,
    this.channelFollowing,
    this.channelFollowers,
    this.totalViews,
    this.totalLikes,
    this.totalDislikes,
    this.totalDownloads,
  });


  AllChannelModel copyWith({
    String? channelId,
    String? channelName,
    String? channelDescription,
    String? channelImage,
    String? channelStatus,
    String? channelType,
    String? channelCreatedDate,
    String? channelUpdatedDate,
    String? channelOwner,
    String? channelFollowing,
    String? channelFollowers,
    String? totalViews,
    String? totalLikes,
    String? totalDislikes,
    String? totalDownloads,
  }) {
    return AllChannelModel(
      channelId: channelId ?? this.channelId,
      channelName: channelName ?? this.channelName,
      channelDescription: channelDescription ?? this.channelDescription,
      channelImage: channelImage ?? this.channelImage,
      channelStatus: channelStatus ?? this.channelStatus,
      channelType: channelType ?? this.channelType,
      channelCreatedDate: channelCreatedDate ?? this.channelCreatedDate,
      channelUpdatedDate: channelUpdatedDate ?? this.channelUpdatedDate,
      channelOwner: channelOwner ?? this.channelOwner,
      channelFollowing: channelFollowing ?? this.channelFollowing,
      channelFollowers: channelFollowers ?? this.channelFollowers,
      totalViews: totalViews ?? this.totalViews,
      totalLikes: totalLikes ?? this.totalLikes,
      totalDislikes: totalDislikes ?? this.totalDislikes,
      totalDownloads: totalDownloads ?? this.totalDownloads,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(channelId != null){
      result.addAll({'channelId': channelId});
    }
    if(channelName != null){
      result.addAll({'channelName': channelName});
    }
    if(channelDescription != null){
      result.addAll({'channelDescription': channelDescription});
    }
    if(channelImage != null){
      result.addAll({'channelImage': channelImage});
    }
    if(channelStatus != null){
      result.addAll({'channelStatus': channelStatus});
    }
    if(channelType != null){
      result.addAll({'channelType': channelType});
    }
    if(channelCreatedDate != null){
      result.addAll({'channelCreatedDate': channelCreatedDate});
    }
    if(channelUpdatedDate != null){
      result.addAll({'channelUpdatedDate': channelUpdatedDate});
    }
    if(channelOwner != null){
      result.addAll({'channelOwner': channelOwner});
    }
    if(channelFollowing != null){
      result.addAll({'channelFollowing': channelFollowing});
    }
    if(channelFollowers != null){
      result.addAll({'channelFollowers': channelFollowers});
    }
    if(totalViews != null){
      result.addAll({'totalViews': totalViews});
    }
    if(totalLikes != null){
      result.addAll({'totalLikes': totalLikes});
    }
    if(totalDislikes != null){
      result.addAll({'totalDislikes': totalDislikes});
    }
    if(totalDownloads != null){
      result.addAll({'totalDownloads': totalDownloads});
    }
  
    return result;
  }

  factory AllChannelModel.fromMap(Map<String, dynamic> map) {
    return AllChannelModel(
      channelId: map['channelId'],
      channelName: map['channelName'],
      channelDescription: map['channelDescription'],
      channelImage: map['channelImage'],
      channelStatus: map['channelStatus'],
      channelType: map['channelType'],
      channelCreatedDate: map['channelCreatedDate'],
      channelUpdatedDate: map['channelUpdatedDate'],
      channelOwner: map['channelOwner'],
      channelFollowing: map['channelFollowing'],
      channelFollowers: map['channelFollowers'],
      totalViews: map['totalViews'],
      totalLikes: map['totalLikes'],
      totalDislikes: map['totalDislikes'],
      totalDownloads: map['totalDownloads'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AllChannelModel.fromJson(String source) => AllChannelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllChannelModel(channelId: $channelId, channelName: $channelName, channelDescription: $channelDescription, channelImage: $channelImage, channelStatus: $channelStatus, channelType: $channelType, channelCreatedDate: $channelCreatedDate, channelUpdatedDate: $channelUpdatedDate, channelOwner: $channelOwner, channelFollowing: $channelFollowing, channelFollowers: $channelFollowers, totalViews: $totalViews, totalLikes: $totalLikes, totalDislikes: $totalDislikes, totalDownloads: $totalDownloads)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AllChannelModel &&
      other.channelId == channelId &&
      other.channelName == channelName &&
      other.channelDescription == channelDescription &&
      other.channelImage == channelImage &&
      other.channelStatus == channelStatus &&
      other.channelType == channelType &&
      other.channelCreatedDate == channelCreatedDate &&
      other.channelUpdatedDate == channelUpdatedDate &&
      other.channelOwner == channelOwner &&
      other.channelFollowing == channelFollowing &&
      other.channelFollowers == channelFollowers &&
      other.totalViews == totalViews &&
      other.totalLikes == totalLikes &&
      other.totalDislikes == totalDislikes &&
      other.totalDownloads == totalDownloads;
  }

  @override
  int get hashCode {
    return channelId.hashCode ^
      channelName.hashCode ^
      channelDescription.hashCode ^
      channelImage.hashCode ^
      channelStatus.hashCode ^
      channelType.hashCode ^
      channelCreatedDate.hashCode ^
      channelUpdatedDate.hashCode ^
      channelOwner.hashCode ^
      channelFollowing.hashCode ^
      channelFollowers.hashCode ^
      totalViews.hashCode ^
      totalLikes.hashCode ^
      totalDislikes.hashCode ^
      totalDownloads.hashCode;
  }
}
