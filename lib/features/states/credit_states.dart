import 'package:search_movies/core/models/credits.dart';

import '../../core/models/models.dart';

abstract class CreditStates {}

class CreditInitial implements CreditStates {}

class CreditLoaging implements CreditStates {}

class CreditLoaded implements CreditStates {
  final Credits credits;

  CreditLoaded({required this.credits});
}

class CreditError implements CreditStates {
  final String message;

  CreditError({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
