import 'package:flutter/material.dart';
import 'package:search_movies/core/models/models.dart';

import '../../../core/values/values.dart';
import 'text_span_card_component.dart';
import 'package:intl/intl.dart';

class BudgetComponent extends StatelessWidget {
  const BudgetComponent({
    Key? key,
    required this.budget,
    required this.companies,
  }) : super(key: key);

  final int budget;
  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    final formatBudget = NumberFormat('#,##0.00', 'pt_BR');

    final companyName =
        companies.map((element) => element.name).toList().join(', ');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextSpanCardComponent(
            title: AppStrings.budget.toUpperCase(),
            subtitle: budget == 0
                ? AppStrings.budgetUnavailable
                : '\$ ${formatBudget.format(budget)}',
          ),
          const SizedBox(height: 4.0),
          TextSpanCardComponent(
            title: AppStrings.productionCompany.toUpperCase(),
            subtitle:
                companies.isEmpty ? AppStrings.budgetUnavailable : companyName,
          ),
        ],
      ),
    );
  }
}
