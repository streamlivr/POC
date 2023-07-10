class Crypto {
final List<Data>? data;
final Meta? meta;
const Crypto({this.data , this.meta });
Crypto copyWith({List<Data>? data, Meta? meta}){
return Crypto(
            data:data ?? this.data,
meta:meta ?? this.meta
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'data': data?.map<Map<String,dynamic>>((data)=> data.toJson()).toList(),
'meta': meta?.toJson()
    };
}

static Crypto fromJson(Map<String , Object?> json){
    return Crypto(
            data:json['data'] == null ? null : (json['data'] as List).map<Data>((data)=> Data.fromJson(data  as Map<String,Object?>)).toList(),
meta:json['meta'] == null ? null : Meta.fromJson(json['meta']  as Map<String,Object?>)
    );
}

@override
String toString(){
    return '''Crypto(
                data:${data.toString()},
meta:${meta.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Crypto && 
        other.runtimeType == runtimeType &&
        other.data == data && 
other.meta == meta;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                data, 
meta
    );
}
    
}
      
      
class Meta {
final int? count;
final int? offset;
const Meta({this.count , this.offset });
Meta copyWith({int? count, int? offset}){
return Meta(
            count:count ?? this.count,
offset:offset ?? this.offset
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'count': count,
'offset': offset
    };
}

static Meta fromJson(Map<String , Object?> json){
    return Meta(
            count:json['count'] == null ? null : json['count'] as int,
offset:json['offset'] == null ? null : json['offset'] as int
    );
}

@override
String toString(){
    return '''Meta(
                count:$count,
offset:$offset
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Meta && 
        other.runtimeType == runtimeType &&
        other.count == count && 
other.offset == offset;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                count, 
offset
    );
}
    
}
      
      
class Data {
final Summary? summary;
final Token? token;
final Sequence? sequence;
final Keys? keys;
final Dpos? dpos;
const Data({this.summary , this.token , this.sequence , this.keys , this.dpos });
Data copyWith({Summary? summary, Token? token, Sequence? sequence, Keys? keys, Dpos? dpos}){
return Data(
            summary:summary ?? this.summary,
token:token ?? this.token,
sequence:sequence ?? this.sequence,
keys:keys ?? this.keys,
dpos:dpos ?? this.dpos
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'summary': summary?.toJson(),
'token': token?.toJson(),
'sequence': sequence?.toJson(),
'keys': keys?.toJson(),
'dpos': dpos?.toJson()
    };
}

static Data fromJson(Map<String , Object?> json){
    return Data(
            summary:json['summary'] == null ? null : Summary.fromJson(json['summary']  as Map<String,Object?>),
token:json['token'] == null ? null : Token.fromJson(json['token']  as Map<String,Object?>),
sequence:json['sequence'] == null ? null : Sequence.fromJson(json['sequence']  as Map<String,Object?>),
keys:json['keys'] == null ? null : Keys.fromJson(json['keys']  as Map<String,Object?>),
dpos:json['dpos'] == null ? null : Dpos.fromJson(json['dpos']  as Map<String,Object?>)
    );
}

@override
String toString(){
    return '''Data(
                summary:${summary.toString()},
token:${token.toString()},
sequence:${sequence.toString()},
keys:${keys.toString()},
dpos:${dpos.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Data && 
        other.runtimeType == runtimeType &&
        other.summary == summary && 
other.token == token && 
other.sequence == sequence && 
other.keys == keys && 
other.dpos == dpos;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                summary, 
token, 
sequence, 
keys, 
dpos
    );
}
    
}
      
      
class Dpos {
final Delegate? delegate;
final List<SentVotes>? sentVotes;
const Dpos({this.delegate , this.sentVotes });
Dpos copyWith({Delegate? delegate, List<SentVotes>? sentVotes}){
return Dpos(
            delegate:delegate ?? this.delegate,
sentVotes:sentVotes ?? this.sentVotes
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'delegate': delegate?.toJson(),
'sentVotes': sentVotes?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static Dpos fromJson(Map<String , Object?> json){
    return Dpos(
            delegate:json['delegate'] == null ? null : Delegate.fromJson(json['delegate']  as Map<String,Object?>),
sentVotes:json['sentVotes'] == null ? null : (json['sentVotes'] as List).map<SentVotes>((data)=> SentVotes.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''Dpos(
                delegate:${delegate.toString()},
sentVotes:${sentVotes.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Dpos && 
        other.runtimeType == runtimeType &&
        other.delegate == delegate && 
other.sentVotes == sentVotes;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                delegate, 
sentVotes
    );
}
    
}
      
      
class SentVotes {
final String? delegateAddress;
final String? amount;
const SentVotes({this.delegateAddress , this.amount });
SentVotes copyWith({String? delegateAddress, String? amount}){
return SentVotes(
            delegateAddress:delegateAddress ?? this.delegateAddress,
amount:amount ?? this.amount
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'delegateAddress': delegateAddress,
'amount': amount
    };
}

static SentVotes fromJson(Map<String , Object?> json){
    return SentVotes(
            delegateAddress:json['delegateAddress'] == null ? null : json['delegateAddress'] as String,
amount:json['amount'] == null ? null : json['amount'] as String
    );
}

@override
String toString(){
    return '''SentVotes(
                delegateAddress:$delegateAddress,
amount:$amount
    ) ''';
}

@override
bool operator ==(Object other){
    return other is SentVotes && 
        other.runtimeType == runtimeType &&
        other.delegateAddress == delegateAddress && 
other.amount == amount;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                delegateAddress, 
amount
    );
}
    
}
      
      
class Delegate {
final String? username;
final int? consecutiveMissedBlocks;
final int? registrationHeight;
final dynamic lastForgedHeight;
final bool? isBanned;
final String? voteWeight;
final String? totalVotesReceived;
final int? producedBlocks;
final int? rank;
final String? status;
final String? rewards;
const Delegate({this.username , this.consecutiveMissedBlocks , this.registrationHeight , this.lastForgedHeight , this.isBanned , this.voteWeight , this.totalVotesReceived , this.producedBlocks , this.rank , this.status , this.rewards });
Delegate copyWith({String? username, int? consecutiveMissedBlocks, int? registrationHeight, dynamic? lastForgedHeight, bool? isBanned, String? voteWeight, String? totalVotesReceived, int? producedBlocks, int? rank, String? status, String? rewards}){
return Delegate(
            username:username ?? this.username,
consecutiveMissedBlocks:consecutiveMissedBlocks ?? this.consecutiveMissedBlocks,
registrationHeight:registrationHeight ?? this.registrationHeight,
lastForgedHeight:lastForgedHeight ?? this.lastForgedHeight,
isBanned:isBanned ?? this.isBanned,
voteWeight:voteWeight ?? this.voteWeight,
totalVotesReceived:totalVotesReceived ?? this.totalVotesReceived,
producedBlocks:producedBlocks ?? this.producedBlocks,
rank:rank ?? this.rank,
status:status ?? this.status,
rewards:rewards ?? this.rewards
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'username': username,
'consecutiveMissedBlocks': consecutiveMissedBlocks,
'registrationHeight': registrationHeight,
'lastForgedHeight': lastForgedHeight,
'isBanned': isBanned,
'voteWeight': voteWeight,
'totalVotesReceived': totalVotesReceived,
'producedBlocks': producedBlocks,
'rank': rank,
'status': status,
'rewards': rewards
    };
}

static Delegate fromJson(Map<String , Object?> json){
    return Delegate(
            username:json['username'] == null ? null : json['username'] as String,
consecutiveMissedBlocks:json['consecutiveMissedBlocks'] == null ? null : json['consecutiveMissedBlocks'] as int,
registrationHeight:json['registrationHeight'] == null ? null : json['registrationHeight'] as int,
lastForgedHeight:json['lastForgedHeight'] as dynamic,
isBanned:json['isBanned'] == null ? null : json['isBanned'] as bool,
voteWeight:json['voteWeight'] == null ? null : json['voteWeight'] as String,
totalVotesReceived:json['totalVotesReceived'] == null ? null : json['totalVotesReceived'] as String,
producedBlocks:json['producedBlocks'] == null ? null : json['producedBlocks'] as int,
rank:json['rank'] == null ? null : json['rank'] as int,
status:json['status'] == null ? null : json['status'] as String,
rewards:json['rewards'] == null ? null : json['rewards'] as String
    );
}

@override
String toString(){
    return '''Delegate(
                username:$username,
consecutiveMissedBlocks:$consecutiveMissedBlocks,
registrationHeight:$registrationHeight,
lastForgedHeight:$lastForgedHeight,
isBanned:$isBanned,
voteWeight:$voteWeight,
totalVotesReceived:$totalVotesReceived,
producedBlocks:$producedBlocks,
rank:$rank,
status:$status,
rewards:$rewards
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Delegate && 
        other.runtimeType == runtimeType &&
        other.username == username && 
other.consecutiveMissedBlocks == consecutiveMissedBlocks && 
other.registrationHeight == registrationHeight && 
other.lastForgedHeight == lastForgedHeight && 
other.isBanned == isBanned && 
other.voteWeight == voteWeight && 
other.totalVotesReceived == totalVotesReceived && 
other.producedBlocks == producedBlocks && 
other.rank == rank && 
other.status == status && 
other.rewards == rewards;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                username, 
consecutiveMissedBlocks, 
registrationHeight, 
lastForgedHeight, 
isBanned, 
voteWeight, 
totalVotesReceived, 
producedBlocks, 
rank, 
status, 
rewards
    );
}
    
}
      
      
class Keys {
final int? numberOfSignatures;
final List<dynamic>? mandatoryKeys;
final List<dynamic>? optionalKeys;
const Keys({this.numberOfSignatures , this.mandatoryKeys , this.optionalKeys });
Keys copyWith({int? numberOfSignatures, List<dynamic>? mandatoryKeys, List<dynamic>? optionalKeys}){
return Keys(
            numberOfSignatures:numberOfSignatures ?? this.numberOfSignatures,
mandatoryKeys:mandatoryKeys ?? this.mandatoryKeys,
optionalKeys:optionalKeys ?? this.optionalKeys
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'numberOfSignatures': numberOfSignatures,
'mandatoryKeys': mandatoryKeys,
'optionalKeys': optionalKeys
    };
}

static Keys fromJson(Map<String , Object?> json){
    return Keys(
            numberOfSignatures:json['numberOfSignatures'] == null ? null : json['numberOfSignatures'] as int,
mandatoryKeys:json['mandatoryKeys'] == null ? null : json['mandatoryKeys'] as List<dynamic>,
optionalKeys:json['optionalKeys'] == null ? null : json['optionalKeys'] as List<dynamic>
    );
}

@override
String toString(){
    return '''Keys(
                numberOfSignatures:$numberOfSignatures,
mandatoryKeys:$mandatoryKeys,
optionalKeys:$optionalKeys
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Keys && 
        other.runtimeType == runtimeType &&
        other.numberOfSignatures == numberOfSignatures && 
other.mandatoryKeys == mandatoryKeys && 
other.optionalKeys == optionalKeys;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                numberOfSignatures, 
mandatoryKeys, 
optionalKeys
    );
}
    
}
      
      
class Sequence {
final String? nonce;
const Sequence({this.nonce });
Sequence copyWith({String? nonce}){
return Sequence(
            nonce:nonce ?? this.nonce
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'nonce': nonce
    };
}

static Sequence fromJson(Map<String , Object?> json){
    return Sequence(
            nonce:json['nonce'] == null ? null : json['nonce'] as String
    );
}

@override
String toString(){
    return '''Sequence(
                nonce:$nonce
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Sequence && 
        other.runtimeType == runtimeType &&
        other.nonce == nonce;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                nonce
    );
}
    
}
      
      
class Token {
final String? balance;
const Token({this.balance });
Token copyWith({String? balance}){
return Token(
            balance:balance ?? this.balance
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'balance': balance
    };
}

static Token fromJson(Map<String , Object?> json){
    return Token(
            balance:json['balance'] == null ? null : json['balance'] as String
    );
}

@override
String toString(){
    return '''Token(
                balance:$balance
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Token && 
        other.runtimeType == runtimeType &&
        other.balance == balance;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                balance
    );
}
    
}
      
      
class Summary {
final String? address;
final String? balance;
final String? username;
final String? publicKey;
final bool? isDelegate;
final bool? isMultisignature;
const Summary({this.address , this.balance , this.username , this.publicKey , this.isDelegate , this.isMultisignature });
Summary copyWith({String? address, String? balance, String? username, String? publicKey, bool? isDelegate, bool? isMultisignature}){
return Summary(
            address:address ?? this.address,
balance:balance ?? this.balance,
username:username ?? this.username,
publicKey:publicKey ?? this.publicKey,
isDelegate:isDelegate ?? this.isDelegate,
isMultisignature:isMultisignature ?? this.isMultisignature
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'address': address,
'balance': balance,
'username': username,
'publicKey': publicKey,
'isDelegate': isDelegate,
'isMultisignature': isMultisignature
    };
}

static Summary fromJson(Map<String , Object?> json){
    return Summary(
            address:json['address'] == null ? null : json['address'] as String,
balance:json['balance'] == null ? null : json['balance'] as String,
username:json['username'] == null ? null : json['username'] as String,
publicKey:json['publicKey'] == null ? null : json['publicKey'] as String,
isDelegate:json['isDelegate'] == null ? null : json['isDelegate'] as bool,
isMultisignature:json['isMultisignature'] == null ? null : json['isMultisignature'] as bool
    );
}

@override
String toString(){
    return '''Summary(
                address:$address,
balance:$balance,
username:$username,
publicKey:$publicKey,
isDelegate:$isDelegate,
isMultisignature:$isMultisignature
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Summary && 
        other.runtimeType == runtimeType &&
        other.address == address && 
other.balance == balance && 
other.username == username && 
other.publicKey == publicKey && 
other.isDelegate == isDelegate && 
other.isMultisignature == isMultisignature;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                address, 
balance, 
username, 
publicKey, 
isDelegate, 
isMultisignature
    );
}
    
}
      
      
  
     