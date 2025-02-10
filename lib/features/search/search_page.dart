import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 24.0, left: 30, right: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/spiderman.png',
                          width: 96,
                          height: 120,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Spiderman',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 14),
                              //rating
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/star.svg'),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '9.5',
                                    style: TextStyle(
                                        color: Color(0xFFFF8700),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              //ticket
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/ticket.svg'),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Action',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              //calendar
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/calendar.svg'),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '2019',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              const SizedBox(height: 4),
                              //time
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/clock.svg'),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '139 minutes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavbar(),
    );
  }
}
