import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class Follow extends StatelessWidget {
  final String followNumber;
  final String followType;

  const Follow(
      {super.key, required this.followNumber, required this.followType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          followNumber,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.v5,
        Text(
          followType,
          style: const TextStyle(
            fontSize: Sizes.size12,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
