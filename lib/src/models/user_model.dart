// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? firstName;
  String? uuid;
  String? lastName;
  String? dateOfBirth;
  String? emailAddress;
  String? password;
  String? phoneNumber;
  String? avatar;
  String? userType;
  UserModel({
    this.firstName,
    this.uuid,
    this.lastName,
    this.dateOfBirth,
    this.emailAddress,
    this.password,
    this.phoneNumber,
    this.avatar,
    this.userType,
  });

  UserModel copyWith({
    String? firstName,
    String? uuid,
    String? lastName,
    String? dateOfBirth,
    String? emailAddress,
    String? password,
    String? phoneNumber,
    String? avatar,
    String? userType,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      uuid: uuid ?? this.uuid,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatar: avatar ?? this.avatar,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'uuid': uuid,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'emailAddress': emailAddress,
      'password': password,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      emailAddress:
          map['emailAddress'] != null ? map['emailAddress'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      userType: map['userType'] != null ? map['userType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, uuid: $uuid, lastName: $lastName, dateOfBirth: $dateOfBirth, emailAddress: $emailAddress, password: $password, phoneNumber: $phoneNumber, avatar: $avatar, userType: $userType)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
        other.uuid == uuid &&
        other.lastName == lastName &&
        other.dateOfBirth == dateOfBirth &&
        other.emailAddress == emailAddress &&
        other.password == password &&
        other.phoneNumber == phoneNumber &&
        other.avatar == avatar &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        uuid.hashCode ^
        lastName.hashCode ^
        dateOfBirth.hashCode ^
        emailAddress.hashCode ^
        password.hashCode ^
        phoneNumber.hashCode ^
        avatar.hashCode ^
        userType.hashCode;
  }
}
