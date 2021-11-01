import 'package:flutter/material.dart';

import '/config/constants.dart';
import 'widgets.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueAccent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35, left: 20, bottom: 20),
                child: CustomText(
                  text: Constants.bannerText,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: null,
                  child: const CustomText(
                    text: 'Buy Now!',
                    color: Colors.blueAccent,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.5,
          right: 0,
          child: Image.asset(
            Constants.bannerImage,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
