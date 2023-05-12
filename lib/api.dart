import 'dart:convert';
import 'dart:developer';

import 'package:crypto_app/model/nft_collection.dart';
import 'package:crypto_app/model/nft_model.dart';
import 'package:crypto_app/widgets/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_notification/in_app_notification.dart';

import 'model/chart.dart';
import 'model/coin.dart';

const _headers = {
  "Content-Type": "application/json",
  "Accept": "application/json",
};

class Api {
  Future<List<CoinModel>?> getCoinMarket(BuildContext context) async {
    // For testing
    // await Future.delayed(const Duration(milliseconds: 2500));

    String url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&locale=en';
    var response = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    var box = await Hive.openBox('coiner');

    if (response.statusCode == 200) {
      box.put('market', response.body);

      return coinModelFromJson(response.body);
    } else {
      print(response.statusCode);

      String? x = box.get('market');

      InAppNotification.show(
        context: context,
        onTap: () => print('Notification tapped!'),
        child: Message(
          messageType: MessageType.error,
          hasHistoricalData: x != null,
        ),
      );

      if (x == null) return null;
      return coinModelFromJson(x);
    }
  }

  Future<List<ChartModel>?> getCoinChart(
      BuildContext context, String id, int days) async {
    // For testing
    // await Future.delayed(const Duration(milliseconds: 2500));

    String url =
        'https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days';
    var response = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    var box = await Hive.openBox('coiner');

    if (response.statusCode == 200) {
      Iterable x = jsonDecode(response.body);
      box.put('$id-$days', x);

      return x.map((e) => ChartModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);

      Iterable? x = box.get('$id-$days');

      InAppNotification.show(
        context: context,
        onTap: () => print('Notification tapped!'),
        child: Message(
          messageType: MessageType.error,
          hasHistoricalData: x != null,
        ),
      );

      if (x == null) return null;
      return x.map((e) => ChartModel.fromJson(e)).toList();
    }
  }

  Future<List<NftCollectionModel>?> getNftList(BuildContext context) async {
    // For testing
    // await Future.delayed(const Duration(milliseconds: 2500));

    String url = 'https://api.coingecko.com/api/v3/nfts/list';
    var response = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    var box = await Hive.openBox('coiner');

    if (response.statusCode == 200) {
      Iterable x = jsonDecode(response.body);
      box.put('nft', x);

      return x.map((e) => NftCollectionModel.fromJson(e)).toList();
    } else {
      print(response.statusCode);

      Iterable? x = box.get('nft');

      InAppNotification.show(
        context: context,
        onTap: () => print('Notification tapped!'),
        child: Message(
          messageType: MessageType.error,
          hasHistoricalData: x != null,
        ),
      );

      if (x == null) return null;
      return x.map((e) => NftCollectionModel.fromJson(e)).toList();
    }
  }

  Future<NftModel?> getNftDetail(BuildContext context, String id) async {
    // For testing
    // await Future.delayed(const Duration(milliseconds: 2500));

    String url = 'https://api.coingecko.com/api/v3/nfts/$id';
    var response = await http.get(
      Uri.parse(url),
      headers: _headers,
    );

    var box = await Hive.openBox('coiner');

    if (response.statusCode == 200) {
      box.put('nft-$id', response.body);

      return nftModelFromJson(response.body);
    } else {
      print(response.statusCode);

      String? x = box.get('nft-$id');

      // InAppNotification.show(
      //   context: context,
      //   onTap: () => print('Notification tapped!'),
      //   child: Message(
      //     messageType: MessageType.error,
      //     hasHistoricalData: x != null,
      //   ),
      // );

      if (x == null) return null;
      return nftModelFromJson(x);
    }
  }
}
