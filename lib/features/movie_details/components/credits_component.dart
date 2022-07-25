import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../core/values/values.dart';
import 'credit_card_component.dart';

class CreditsComponent extends StatelessWidget {
  const CreditsComponent({Key? key, required this.credits}) : super(key: key);

  final Credits credits;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardComponent(
          title: AppStrings.crewTitle,
          description: credits.crew.map((e) => e.name).toString(),
        ),
        const SizedBox(height: 32.0),
        CreditCardComponent(
          title: AppStrings.castTitle,
          description: credits.casts.map((e) => e.name).toString(),
        ),
      ],
    );
  }
}
