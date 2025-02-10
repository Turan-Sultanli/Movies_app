import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Center(
          child: Text(
            'Watchlist',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ), 
      body:Container(
              padding: const EdgeInsets.all(24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/spiderman.png',
                      fit: BoxFit.cover,
                      height: 160,
                      width: 120,
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Spiderman',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/star.svg'),
                          const SizedBox(width: 4),
                          const Text(
                            'Ratings',
                            style: TextStyle(color: Color(0xFFFF8700)),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/ticket.svg'),
                          const SizedBox(width: 4),
                          const Text(
                            'Action',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          const SizedBox(width: 4),
                          const Text(
                            '2019',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/clock.svg'),
                          const SizedBox(width: 4),
                          const Text(
                            '139 minutes',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
