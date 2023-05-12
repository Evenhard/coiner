import 'dart:convert';

NftCollectionModel nftCollectionModelFromJson(String str) =>
    NftCollectionModel.fromJson(json.decode(str));

String nftCollectionModelToJson(NftCollectionModel data) =>
    json.encode(data.toJson());

class NftCollectionModel {
  String id;
  String? contractAddress;
  String name;
  String assetPlatformId;
  String? symbol;

  NftCollectionModel({
    required this.id,
    required this.contractAddress,
    required this.name,
    required this.assetPlatformId,
    required this.symbol,
  });

  factory NftCollectionModel.fromJson(Map<String, dynamic> json) =>
      NftCollectionModel(
        id: json["id"],
        contractAddress: json["contract_address"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract_address": contractAddress,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "symbol": symbol,
      };
}
