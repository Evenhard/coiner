import 'package:crypto_app/animation/shimmer.dart';
import 'package:crypto_app/animation/shimmer_loading.dart';
import 'package:crypto_app/resources/app_styles.dart';
import 'package:flutter/material.dart';

import '../../api.dart';
import '../../model/nft_model.dart';
import '../../resources/app_dimens.dart';

class NftItem extends StatefulWidget {
  const NftItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  _NftItemState createState() => _NftItemState();
}

class _NftItemState extends State<NftItem> {
  @override
  void initState() {
    getNftItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (isLoading) {
      return Shimmer(
        linearGradient: AppStyles.SHIMMER_GRADIENT,
        child: Card(
          elevation: 2,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS),
            //set border radius more than 50% of height and width to make circle
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: AppDimens.PADDING_M,
            vertical: AppDimens.PADDING_S,
          ),
          child: ShimmerLoading(
            isLoading: isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.PADDING_M,
                vertical: AppDimens.PADDING_S,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 25,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          // width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 25,
                          // width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 25,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 25,
                          width: 90,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (nftItem == null) {
      return Container();
    }

    return Card(
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS),
        //set border radius more than 50% of height and width to make circle
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_M,
        vertical: AppDimens.PADDING_S,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.PADDING_M,
          vertical: AppDimens.PADDING_S,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      nftItem?.image.small ?? '',
                    ),
                  ),
                  Text(nftItem?.name ?? ''),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 2,
              child: Text(nftItem?.description ?? ''),
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = true;

  NftModel? nftItem;

  Future<void> getNftItem() async {
    setState(() {
      isLoading = true;
    });

    NftModel? tempItem = await Api().getNftDetail(context, widget.id);

    setState(() {
      isLoading = false;
      nftItem = tempItem;
    });
  }
}
