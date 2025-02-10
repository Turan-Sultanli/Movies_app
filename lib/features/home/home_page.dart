import 'package:flutter/material.dart';
import 'package:movies_app/features/home/widgets/movies_filter_tabs.dart';
import 'package:movies_app/features/home/widgets/movies_filtered_list.dart';
import 'package:movies_app/features/home/widgets/movies_full_list.dart';
import 'package:movies_app/features/home/widgets/search_input.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          'What do you want to watch?',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            SearchInput(),

            SizedBox(height: 20),
            // Slider
            MoviesFullList(),
            SizedBox(height: 20),
            // TabBar
            MoviesFilterTabs(),

            SizedBox(height: 20),
            //filtered slider
            MoviesFilteredList()
          ],
        ),
      ),
    );
  }
}
