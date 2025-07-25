import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeSet = false;
  bool _lactoseFreeSet = false;
  bool _vegetarianSet = false;
  bool _veganSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianSet = widget.currentFilters[Filter.vegetarian]!;
    _veganSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yours filters')),
      /*drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        },
      ),*/
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeSet,
            Filter.lactoseFree: _lactoseFreeSet,
            Filter.vegetarian: _vegetarianSet,
            Filter.vegan: _veganSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeSet,
              onChanged: (newValue) {
                setState(() {
                  _glutenFreeSet = newValue;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeSet,
              onChanged: (newValue) {
                setState(() {
                  _lactoseFreeSet = newValue;
                });
              },
              title: Text(
                'Lactose',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include lactose-free meals.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianSet,
              onChanged: (newValue) {
                setState(() {
                  _vegetarianSet = newValue;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegetarian meals.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            SwitchListTile(
              value: _veganSet,
              onChanged: (newValue) {
                setState(() {
                  _veganSet = newValue;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                'Only include vegan meals.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
