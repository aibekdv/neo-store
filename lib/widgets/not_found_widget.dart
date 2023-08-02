import 'package:flutter/material.dart';
import 'package:neo_store/config/config.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 215,
            height: 177,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyBgColor,
                  blurRadius: 0.3,
                  blurStyle: BlurStyle.solid,
                  offset: Offset.infinite,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/not_found.png",
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'No Results Found',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w700,
              height: 1.43,
            ),
          ),
        ],
      ),
    );
  }
}
