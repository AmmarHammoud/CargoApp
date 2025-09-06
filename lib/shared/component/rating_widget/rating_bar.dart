import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_and_feedback_collector/rating_and_feedback_collector.dart';
import 'cubit/cubit.dart';

class MyRatingBar extends StatefulWidget {
  const MyRatingBar({
    super.key,
    required this.id,
    required this.rating,
  });

  final String id;
  final double rating;

  @override
  State<MyRatingBar> createState() => _MyRatingBarState();
}

class _MyRatingBarState extends State<MyRatingBar> {

  @override
  Widget build(BuildContext context) {
    double rating = widget.rating;
    return RatingBarEmoji(
      imageSize: 45,
      currentRating: rating,
      onRatingChanged: (rating) {
        setState(() {
          rating = rating;
        });
      },
      showFeedbackForRatingsLessThan: 4.0,
      feedbackUIType: FeedbackUIType.alertBox,
      onSubmitTap: (selectedFeedback, description) {
        print('rating: $rating');
        print('category: ${selectedFeedback!.value}');
        print('text: $description');
        context.read<RatingCubit>().rateShipment(
              id: widget.id,
              rating: rating,
              comment: description!,
            );

      },
    );

    // return RatingBar(
    //   iconSize: 40, // Size of the rating icons
    //   allowHalfRating: true, // Allows selection of half ratings
    //   filledIcon: Icons.star, // Icon to display for a filled rating unit
    //   halfFilledIcon: Icons.star_half, // Icon to display for a half-filled rating unit
    //   emptyIcon: Icons.star_border, // Icon to display for an empty rating units
    //   filledColor: Colors.amber, // Color of filled rating units
    //   emptyColor: Colors.grey, // Color of empty rating units
    //   currentRating: _rating, // Set initial rating value
    //   onRatingChanged: (rating) { // Callback triggered when the rating is changed
    //     setState(() { _rating = rating; });
    //   },
    // );
  }
}
