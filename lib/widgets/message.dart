import 'package:crypto_app/resources/app_dimens.dart';
import 'package:crypto_app/resources/app_styles.dart';
import 'package:flutter/material.dart';

enum MessageType { error, success }

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.messageType,
    this.hasHistoricalData,
  }) : super(key: key);

  final MessageType messageType;
  final bool? hasHistoricalData;

  Widget _errorMsg() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_S,
        vertical: AppDimens.PADDING_M,
      ),
      child: Container(
        // height: 50,
        // color: Colors.amber,
        child: Row(
          children: [
            Image.asset(
              'assets/icons/error.png',
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ой, кажется, что-то сломалось!',
                    style: AppStyles.H,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Это бесплатная API, будь добр, не жамкай слишком часто запросы. Подожди немного и давай по новой...',
                    style: AppStyles.P1,
                  ),
                  if (hasHistoricalData == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Мы загрузили тебе исторические данные, чтобы не было так пусто',
                        style: AppStyles.P1,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMsgType() {
    switch (messageType) {
      case MessageType.success:
        return _errorMsg();
      case MessageType.error:
        return _errorMsg();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_M,
        vertical: AppDimens.PADDING_S,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.BORDER_RADIUS),
          //set border radius more than 50% of height and width to make circle
        ),
        child: _getMsgType(),
      ),
    );
  }
}
