import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favoritescreen';

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Favorite Screen'),
      ),
    );
  }
}
