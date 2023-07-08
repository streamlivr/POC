class CryptoModel {
final String? time;
final String? assetIdBase;
final String? assetIdQuote;
final double? rate;
const CryptoModel({this.time , this.assetIdBase , this.assetIdQuote , this.rate });
CryptoModel copyWith({String? time, String? assetIdBase, String? assetIdQuote, double? rate}){
return CryptoModel(
            time:time ?? this.time,
assetIdBase:assetIdBase ?? this.assetIdBase,
assetIdQuote:assetIdQuote ?? this.assetIdQuote,
rate:rate ?? this.rate
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'time': time,
'asset_id_base': assetIdBase,
'asset_id_quote': assetIdQuote,
'rate': rate
    };
}

static CryptoModel fromJson(Map<String , Object?> json){
    return CryptoModel(
            time:json['time'] == null ? null : json['time'] as String,
assetIdBase:json['asset_id_base'] == null ? null : json['asset_id_base'] as String,
assetIdQuote:json['asset_id_quote'] == null ? null : json['asset_id_quote'] as String,
rate:json['rate'] == null ? null : json['rate'] as double
    );
}

@override
String toString(){
    return '''CryptoModel(
                time:$time,
assetIdBase:$assetIdBase,
assetIdQuote:$assetIdQuote,
rate:$rate
    ) ''';
}

@override
bool operator ==(Object other){
    return other is CryptoModel && 
        other.runtimeType == runtimeType &&
        other.time == time && 
other.assetIdBase == assetIdBase && 
other.assetIdQuote == assetIdQuote && 
other.rate == rate;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                time, 
assetIdBase, 
assetIdQuote, 
rate
    );
}
    
}
      
      
  
     