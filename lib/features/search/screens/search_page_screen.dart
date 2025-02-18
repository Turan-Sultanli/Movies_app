import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/features/search/widgets/search_result_item.dart';
import 'package:movies_app/provider/searchpage_query_provider.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(36),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: AppBar(
            title: const Center(
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [SvgPicture.asset('assets/icons/exclamation.svg')],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 30, right: 16, bottom: 24),
            child: SizedBox(
              height: 42,
              child: TextField(
                onChanged: (value) {
                  ref.read(searchpageQueryProvider.notifier).state = value;
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        top: 10, left: 24, right: 14, bottom: 10),
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF3A3F47),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 14,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/Search.svg',
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ),
          const SearchResultItem(),
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavbar(),
    );
  }
}
