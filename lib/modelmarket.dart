import 'dart:async';
import 'dart:core';

final String tableMarket = 'markets';

class MarketModel {
  static final List<String> value = [
    market_code,
    market_name,
    market_address,
    latitude_longtitude,
    photo,
    photo_path,
    created_date,
    update_date,
  ];
  static final String market_code = 'market_code';
  static final String market_name = 'market_name';
  static final String market_address = 'market_address';
  static final String latitude_longtitude = 'latitude_longtitude';
  static final String photo = 'photo';
  static final String photo_path = 'photo_path';
  static final String created_date = 'created_date';
  static final String update_date = 'update_date';
}

class market {
  int? market_code;
  String? market_name;
  String? market_address;
  int? latitude_longtitude;
  String? photo;
  String? photo_path;
  int? created_date;
  int? update_date;

  market(
      {this.market_code,
      this.market_name,
      this.market_address,
      this.latitude_longtitude,
      this.photo,
      this.photo_path,
      this.created_date,
      this.update_date});

  market copy({
    int? market_code,
    String? market_name,
    String? market_address,
    int? latitude_longtitude,
    String? photo,
    String? photo_path,
    int? created_date,
    int? update_date,
  }) =>
      market(
        market_code: market_code ?? this.market_code,
        market_name: market_name ?? this.market_name,
        market_address: market_address ?? this.market_address,
        latitude_longtitude: latitude_longtitude ?? this.latitude_longtitude,
        photo: photo ?? this.photo,
        photo_path: photo_path ?? photo_path,
        created_date: created_date ?? created_date,
        update_date: update_date ?? update_date,
      );
  static market fromJson(Map<String, Object?> json) => market(
        market_code: json[MarketModel.market_code] as int?,
        market_name: json[MarketModel.market_name] as String?,
        market_address: json[MarketModel.market_address] as String?,
        latitude_longtitude: json[MarketModel.latitude_longtitude] as int?,
        photo: json[MarketModel.photo] as String?,
        photo_path: json[MarketModel.photo_path] as String?,
        created_date: json[MarketModel.created_date] as int?,
        update_date: json[MarketModel.update_date] as int?,
      );
  Map<String, Object?> toJSon() => {
        MarketModel.market_code: market_code,
        MarketModel.market_name: market_name,
        MarketModel.market_address: market_address,
        MarketModel.latitude_longtitude: latitude_longtitude,
        MarketModel.photo: photo,
        MarketModel.photo_path: photo_path,
        MarketModel.created_date: created_date,
        MarketModel.update_date: update_date,
      };
}
