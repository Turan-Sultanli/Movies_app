import 'package:flutter/material.dart';
import 'package:movies_app/features/details/widget/about_movie.dart';
import 'package:movies_app/features/details/widget/review_movie.dart';

class DetailsTabs extends StatelessWidget {
  const DetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 24),
            child: TabBar(
              tabs: [
                Tab(text: 'About Movie',),
                Tab(text: 'Reviews'),
              ],
              labelPadding: EdgeInsets.only(right: 12),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.grey,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                AboutMovie(),
                ReviewMovie(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
