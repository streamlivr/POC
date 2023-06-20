// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseModel {
  String? status;
  dynamic data;
  ResponseModel({
    this.status,
    required this.data,
  });

  ResponseModel copyWith({
    String? status,
    dynamic data,
  }) {
    return ResponseModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'data': data,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      status: map['status'] != null ? map['status'] as String : null,
      data: map['data'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseModel(status: $status, data: $data)';

  @override
  bool operator ==(covariant ResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.status == status &&
      other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
