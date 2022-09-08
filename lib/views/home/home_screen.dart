import 'package:flutter/material.dart';
import 'package:grift_shop/routes/routes.dart';
import 'package:grift_shop/utils/app_environment.dart';
import 'package:grift_shop/views/home/explore_gifts/explore_gifts.dart';
import 'package:grift_shop/views/home/liked_gifts/liked_gifts.dart';
import 'package:grift_shop/views/home/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        onPageChanged: (i) {
          setState(() {
            pageNumber = i;
          });
        },
        children: [
          const ExploreGifts(),
          const LikedGifts(),
          Container(),
        ],
      ),
      bottomNavigationBar: AppBottomBar(
        selectedItem: pageNumber,
        onTap: (i) async {
          _controller.jumpToPage(i);
          if (pageNumber == 2) {
            await AppEnvironment.navigator.pushNamed(HomeRoute.myBag);
            _controller.jumpToPage(0);
          }
        },
      ),
    );
  }
}
