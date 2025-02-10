import 'package:flutter/material.dart';
import 'package:movies_app/features/details/widget/review_card.dart';

class ReviewMovie extends StatelessWidget {
  const ReviewMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ReviewCard(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
