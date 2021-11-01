import 'package:flutter/material.dart';

class ShareScreen extends StatelessWidget {
  static const routeName = '/sharescreen';

  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Share Screen'),
      ),
    );
  }
}
