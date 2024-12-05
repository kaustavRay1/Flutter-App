import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(0.0), // Adds spacing around the container
      decoration: BoxDecoration(
        color: Colors.blue, // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Soft shadow
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Apply border radius to the swiper
        child: Swiper(
          scale: 3,
          autoplayDelay: 1000,
          allowImplicitScrolling: true,
          itemBuilder: (context, index) {
            return Image.asset(
              images[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: images.length,
          autoplay: true,
          duration: 1200,
          pagination: const SwiperPagination(),
        ),
      ),
    );
  }
}

// Dummy image list for Swiper
const List<String> images = [
  'assets/images1.jpeg',
  'assets/images2.jpeg',
  'assets/images3.jpg'
];
