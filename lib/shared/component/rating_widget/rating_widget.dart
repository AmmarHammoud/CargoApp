import 'package:carge_app/shared/component/rating_widget/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../my_loader_indicator.dart';
import '../show_toast.dart';
import 'cubit/states.dart';
import 'rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit()..getShipmentRating(id: id),
      child: BlocConsumer<RatingCubit, RatingStates>(
        listener: (context, state) {
          if (state is RatingSuccessState) {
            showToast(
              context: context,
              text: 'Thanks for your rating! 😊',
              color: Constants.successColor,
            );
          }
        },
        builder: (context, state) {
          var cubit = RatingCubit.get(context);
          return ConditionalBuilder(
            condition: state is RatingLoadingState,
            builder: (context) => const Center(
              child: Column(
                children: [Text('Sending your rating...'), MyLoaderIndicator()],
              ),
            ),
            fallback: (context) => Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Rate the shipment process'),
                      MyRatingBar(id: id, rating: cubit.rating),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
