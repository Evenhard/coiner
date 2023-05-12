import 'package:crypto_app/model/nft_collection.dart';
import 'package:flutter/material.dart';

import '../api.dart';
import '../resources/app_dimens.dart';
import 'home/coins_list.dart';
import 'nft/nft_list.dart';

class NftPage extends StatefulWidget {
  const NftPage({
    Key? key,
  }) : super(key: key);

  @override
  _NftPageState createState() => _NftPageState();
}

class _NftPageState extends State<NftPage> {
  @override
  void initState() {
    getNftList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        // color: const Color(0xFFF8F9FA),
        width: width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(AppDimens.PADDING_S),
              child: Text('data'),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => getNftList(),
                child: NftList(
                  isLoading: isLoading,
                  list: nftList!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isLoading = true;

  List<NftCollectionModel>? nftList = [];

  Future<void> getNftList() async {
    setState(() {
      isLoading = true;
    });

    List<NftCollectionModel>? tempList = await Api().getNftList(context);

    setState(() {
      isLoading = false;
      nftList = tempList;
    });
  }
}
