import 'package:crypto_app/animation/shimmer.dart';
import 'package:crypto_app/animation/shimmer_loading.dart';
import 'package:crypto_app/model/coin.dart';
import 'package:crypto_app/pages/home/coin_item.dart';
import 'package:crypto_app/pages/home/coin_skeleton.dart';
import 'package:crypto_app/resources/app_styles.dart';
import 'package:flutter/material.dart';

import '../../resources/app_dimens.dart';

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
      return Shimmer(
        linearGradient: AppStyles.SHIMMER_GRADIENT,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const CoinSkeleton();
          },
        ),
      );
    }

    if (!isLoading && list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/error.png'),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.PADDING_M,
              ),
              child: Text(
                'Это бесплатная API, будь добр, не жамкай слишком часто запросы. Подожди немного и давай по новой...',
                style: AppStyles.H,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
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
