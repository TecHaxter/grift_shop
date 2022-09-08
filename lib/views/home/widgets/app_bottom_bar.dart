import 'package:flutter/material.dart';
import 'package:grift_shop/utils/utils.dart';
import 'package:iconly/iconly.dart';

class AppBottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedItem;
  const AppBottomBar(
      {Key? key, required this.onTap, required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [IconlyLight.home, IconlyLight.heart, IconlyLight.bag]
            .mapIndexed(
              (int index, IconData icon) => MaterialButton(
                onPressed: () => onTap(index),
                child: SizedBox(
                  width: 76.w,
                  height: double.maxFinite,
                  child: Stack(
                    children: [
                      if (selectedItem == index) ...{
                        Positioned(
                          top: 16.h,
                          left: 0.0,
                          right: 0.0,
                          child: CircleAvatar(
                            radius: 2.r,
                            backgroundColor: Colors.black,
                          ),
                        )
                      },
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0.0,
                        left: 0.0,
                        child: Icon(icon),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
