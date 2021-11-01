import 'package:achintha_dilesha_flutter_interview_test/config/constants.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CustomText(
        text: Constants.welcomeText,
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
