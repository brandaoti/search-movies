import 'package:flutter/material.dart';

import '../../../core/values/values.dart';
import 'text_span_card_component.dart';

class MovieReleaseDateComponent extends StatelessWidget {
  const MovieReleaseDateComponent({
    Key? key,
    required this.date,
    required this.runtime,
  }) : super(key: key);

  final int runtime;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final duration = TimeOfDay(
      hour: (runtime / 60).round(),
      minute: (runtime % 60),
    );

    final hour = (duration.hour > 0 ? '${duration.hour}h ' : '');
    final minute = (duration.minute > 0 ? '${duration.minute} min' : '');

    final subtitle = '$hour $minute';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextSpanCardComponent(
            title: AppStrings.movieYear,
            subtitle: '${date.year}'.isEmpty
                ? AppStrings.unavailable
                : '${date.year}',
          ),
          const SizedBox(width: 12),
          TextSpanCardComponent(
            title: AppStrings.movieDuration,
            subtitle: subtitle,
          ),
        ],
      ),
    );
  }
}
