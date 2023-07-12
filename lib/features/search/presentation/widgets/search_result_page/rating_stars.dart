import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.ratingScroe});
  final double ratingScroe;

  @override
  Widget build(BuildContext context) {
    switch (ratingScroe) {
      case 0.0:
        return Row(
          children: [
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 0.5:
        return Row(
          children: [
            Icon(Icons.star_half, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 1.0:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 1.5:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_half, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 2.0:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 2.5:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_half, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 3.0:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 3.5:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_half, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 4.0:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_border, color: Colors.yellow[800]),
          ],
        );
      case <= 4.5:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star_half, color: Colors.yellow[800]),
          ],
        );
      case <= 5.0:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
          ],
        );
      default:
        return Row(
          children: [
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
            Icon(Icons.star, color: Colors.yellow[800]),
          ],
        );
    }
  }
}
