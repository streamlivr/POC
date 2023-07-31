// ignore_for_file: public_member_api_docs, sort_constructors_first
class WalletDetailModel {
  final String? passphrase;
  final String? privateKey;
  final String? publicKey;
  final String? binaryAddress;
  final String? address;
  const WalletDetailModel({
    this.passphrase,
    this.privateKey,
    this.publicKey,
    this.binaryAddress,
    this.address,
  });
  WalletDetailModel copyWith(
      {String? passphrase,
      String? privateKey,
      String? publicKey,
      String? binaryAddress,
      String? address}) {
    return WalletDetailModel(
        passphrase: passphrase ?? this.passphrase,
        privateKey: privateKey ?? this.privateKey,
        publicKey: publicKey ?? this.publicKey,
        binaryAddress: binaryAddress ?? this.binaryAddress,
        address: address ?? this.address);
  }

  Map<String, Object?> toJson() {
    return {
      'passphrase': passphrase,
      'privateKey': privateKey,
      'publicKey': publicKey,
      'binaryAddress': binaryAddress,
      'address': address
    };
  }

  static WalletDetailModel fromJson(Map<String, Object?> json) {
    return WalletDetailModel(
        passphrase:
            json['passphrase'] == null ? null : json['passphrase'] as String,
        privateKey:
            json['privateKey'] == null ? null : json['privateKey'] as String,
        publicKey:
            json['publicKey'] == null ? null : json['publicKey'] as String,
        binaryAddress: json['binaryAddress'] == null
            ? null
            : json['binaryAddress'] as String,
        address: json['address'] == null ? null : json['address'] as String);
  }

  @override
  String toString() {
    return '''WalletDetailModel(
                passphrase:$passphrase,
privateKey:$privateKey,
publicKey:$publicKey,
binaryAddress:$binaryAddress,
address:$address
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is WalletDetailModel &&
        other.runtimeType == runtimeType &&
        other.passphrase == passphrase &&
        other.privateKey == privateKey &&
        other.publicKey == publicKey &&
        other.binaryAddress == binaryAddress &&
        other.address == address;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, passphrase, privateKey, publicKey, binaryAddress, address);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'passphrase': passphrase,
      'privateKey': privateKey,
      'publicKey': publicKey,
      'binaryAddress': binaryAddress,
      'address': address,
    };
  }

  factory WalletDetailModel.fromMap(Map<String, dynamic> map) {
    return WalletDetailModel(
      passphrase:
          map['passphrase'] != null ? map['passphrase'] as String : null,
      privateKey:
          map['privateKey'] != null ? map['privateKey'] as String : null,
      publicKey: map['publicKey'] != null ? map['publicKey'] as String : null,
      binaryAddress:
          map['binaryAddress'] != null ? map['binaryAddress'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
    );
  }
}
