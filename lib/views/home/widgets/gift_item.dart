import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/app_text_styles.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';
import 'package:iconly/iconly.dart';

class GiftItem extends StatelessWidget {
  final String assetImage;
  final String name;
  final String price;
  final bool? liked;
  final Function(bool) likeFeedback;
  final bool? maxWidth;
  const GiftItem({
    Key? key,
    required this.assetImage,
    required this.name,
    required this.price,
    this.liked,
    this.maxWidth,
    required this.likeFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedBox(
      width: maxWidth ?? false ? null : 200.w,
      height: maxWidth ?? false ? 220.h : null,
      borderRadius: 16.r,
      child: Column(
        children: [
          Expanded(
            child: RoundedBox(
              borderRadius: 16.r,
              paddingDisable: true,
              child: Image.asset(
                assetImage,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          sizedBoxWithHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.text16w400Black,
                  ),
                  Text(
                    price,
                    style: AppTextStyles.text16w800Black,
                  ),
                ],
              ),
              InkWell(
                onTap: () => likeFeedback(!(liked ?? false)),
                child: RoundedBox(
                  width: 40.r,
                  height: 40.r,
                  child: liked == true
                      ? Icon(IconlyBold.heart)
                      : Icon(IconlyLight.heart),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
