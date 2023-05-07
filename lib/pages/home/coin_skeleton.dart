import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_app/animation/shimmer.dart';
import 'package:crypto_app/animation/shimmer_loading.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_dimens.dart';
import '../../resources/app_styles.dart';

class CoinSkeleton extends StatelessWidget {
  const CoinSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: ShimmerLoading(
        isLoading: true,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.PADDING_M),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 25,
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
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  // width: 70,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 25,
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
                      width: 50,
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
    );
  }
}
