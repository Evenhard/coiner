import 'dart:convert';

NftModel nftModelFromJson(String str) => NftModel.fromJson(json.decode(str));

String nftModelToJson(NftModel data) => json.encode(data.toJson());

class NftModel {
  String id;
  String contractAddress;
  String assetPlatformId;
  String name;
  String symbol;
  Images image;
  String description;
  String nativeCurrency;
  FloorPrice floorPrice;
  FloorPrice marketCap;
  FloorPrice volume24H;
  double floorPriceInUsd24HPercentageChange;
  double numberOfUniqueAddresses;
  double numberOfUniqueAddresses24HPercentageChange;
  double totalSupply;
  Links links;

  NftModel({
    required this.id,
    required this.contractAddress,
    required this.assetPlatformId,
    required this.name,
    required this.symbol,
    required this.image,
    required this.description,
    required this.nativeCurrency,
    required this.floorPrice,
    required this.marketCap,
    required this.volume24H,
    required this.floorPriceInUsd24HPercentageChange,
    required this.numberOfUniqueAddresses,
    required this.numberOfUniqueAddresses24HPercentageChange,
    required this.totalSupply,
    required this.links,
  });

  factory NftModel.fromJson(Map<String, dynamic> json) => NftModel(
        id: json["id"],
        contractAddress: json["contract_address"],
        assetPlatformId: json["asset_platform_id"],
        name: json["name"],
        symbol: json["symbol"],
        image: Images.fromJson(json["image"]),
        description: json["description"],
        nativeCurrency: json["native_currency"],
        floorPrice: FloorPrice.fromJson(json["floor_price"]),
        marketCap: FloorPrice.fromJson(json["market_cap"]),
        volume24H: FloorPrice.fromJson(json["volume_24h"]),
        floorPriceInUsd24HPercentageChange:
            json["floor_price_in_usd_24h_percentage_change"]?.toDouble(),
        numberOfUniqueAddresses: json["number_of_unique_addresses"].toDouble(),
        numberOfUniqueAddresses24HPercentageChange:
            json["number_of_unique_addresses_24h_percentage_change"].toDouble(),
        totalSupply: json["total_supply"].toDouble(),
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "contract_address": contractAddress,
        "asset_platform_id": assetPlatformId,
        "name": name,
        "symbol": symbol,
        "image": image.toJson(),
        "description": description,
        "native_currency": nativeCurrency,
        "floor_price": floorPrice.toJson(),
        "market_cap": marketCap.toJson(),
        "volume_24h": volume24H.toJson(),
        "floor_price_in_usd_24h_percentage_change":
            floorPriceInUsd24HPercentageChange,
        "number_of_unique_addresses": numberOfUniqueAddresses,
        "number_of_unique_addresses_24h_percentage_change":
            numberOfUniqueAddresses24HPercentageChange,
        "total_supply": totalSupply,
        "links": links.toJson(),
      };
}

class FloorPrice {
  double nativeCurrency;
  double usd;

  FloorPrice({
    required this.nativeCurrency,
    required this.usd,
  });

  factory FloorPrice.fromJson(Map<String, dynamic> json) => FloorPrice(
        nativeCurrency: json["native_currency"]?.toDouble(),
        usd: json["usd"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "native_currency": nativeCurrency,
        "usd": usd,
      };
}

class Images {
  String small;

  Images({
    required this.small,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
      };
}

class Links {
  String homepage;
  String twitter;
  String discord;

  Links({
    required this.homepage,
    required this.twitter,
    required this.discord,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: json["homepage"],
        twitter: json["twitter"],
        discord: json["discord"],
      );

  Map<String, dynamic> toJson() => {
        "homepage": homepage,
        "twitter": twitter,
        "discord": discord,
      };
}
