import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/homescreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: appBarActionsList,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            WelcomeTitle(),
            BannerCard(),
            CategoryListView(),
            ProductList(),
          ],
        ),
      ),
    );
  }

  List<Widget> get appBarActionsList {
    return const [
      Padding(
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: AppBarButton(
          iconName: Icons.search_outlined,
          iconColor: Colors.black,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 20,
          top: 15,
        ),
        child: AppBarButton(
          iconName: Icons.shopping_bag_outlined,
          iconColor: Colors.black,
          isDotActive: true,
        ),
      ),
    ];
  }
}
