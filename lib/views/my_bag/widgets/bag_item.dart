import 'package:flutter/material.dart';
import 'package:grift_shop/data/constants/app_text_styles.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:grift_shop/views/common/common.dart';

class BagItem extends StatelessWidget {
  final String assetPath;
  final String name;
  final String price;
  final String quantity;
  final Function(bool) incrementQuantity;
  const BagItem({
    Key? key,
    required this.assetPath,
    required this.name,
    required this.price,
    required this.quantity,
    required this.incrementQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96.r,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          RoundedBox(
            width: 96.r,
            paddingDisable: true,
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: EdgeInsets.all(6.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          sizedBoxWithWidth(24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.text14w400Black,
                    ),
                    sizedBoxWithHeight(8),
                    Text(
                      price,
                      style: AppTextStyles.text16w800Black,
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () => incrementQuantity(false),
                      child: RoundedBox(
                        width: 24.r,
                        height: 24.r,
                        paddingDisable: true,
                        borderRadius: 8.r,
                        child: Text(
                          '-',
                          style: AppTextStyles.text14w500Black,
                        ),
                      ),
                    ),
                    sizedBoxWithWidth(16),
                    Text(
                      quantity,
                      style: AppTextStyles.text14w800Black,
                    ),
                    sizedBoxWithWidth(16),
                    InkWell(
                      onTap: () => incrementQuantity(true),
                      child: RoundedBox(
                        width: 24.r,
                        height: 24.r,
                        paddingDisable: true,
                        borderRadius: 8.r,
                        child: Text(
                          '+',
                          style: AppTextStyles.text14w500Black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
