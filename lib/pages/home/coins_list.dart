import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/pages/home/coin_item.dart';
import 'package:flutter/material.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({
    Key? key,
    required this.isLoading,
    required this.list,
  }) : super(key: key);

  final bool isLoading;
  final List<CoinModel> list;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return CoinItem(item: list[index]);
      },
    );
  }
}
