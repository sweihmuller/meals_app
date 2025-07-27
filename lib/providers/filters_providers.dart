import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/filters.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifiers extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifiers()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProviders =
    StateNotifierProvider<FiltersNotifiers, Map<Filter, bool>>(
      (ref) => FiltersNotifiers(),
    );
