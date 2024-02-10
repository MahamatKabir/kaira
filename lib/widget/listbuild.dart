import 'package:flutter/material.dart';

class ListBills<T> extends StatelessWidget {
  final List<T> items;
  final Function(T) onDelete;
  final Function(T) onUpdate;
  final Widget Function(BuildContext, T) itemBuilder;

  const ListBills({
    Key? key,
    required this.items,
    required this.onDelete,
    required this.onUpdate,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 320,
      left: 0,
      right: 0,
      bottom: 0,
      child: MediaQuery.removePadding(
        context: context,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                // Exécuter l'action onTap avec l'élément sélectionné
                onUpdate(item);
              },
              child: Card(
                color: Colors.black26,
                child: itemBuilder(context, item),
              ),
            );
          },
        ),
      ),
    );
  }
}
