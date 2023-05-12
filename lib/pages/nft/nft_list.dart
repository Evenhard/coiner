import 'package:crypto_app/model/nft_collection.dart';
import 'package:crypto_app/pages/nft/nft_item.dart';
import 'package:flutter/material.dart';

import '../../animation/shimmer.dart';
import '../../resources/app_dimens.dart';
import '../../resources/app_styles.dart';

class NftList extends StatelessWidget {
  const NftList({
    Key? key,
    required this.isLoading,
    required this.list,
  }) : super(key: key);

  final bool isLoading;
  final List<NftCollectionModel> list;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer(
        linearGradient: AppStyles.SHIMMER_GRADIENT,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container();
            // return const CoinSkeleton();
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
                'Ой, кажется, данные где-то потерялись.\nМожет, их кто-то украл?',
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
        var item = list[index];
        return NftItem(id: item.id);
        // return CoinItem(item: list[index]);
      },
    );
  }
}
