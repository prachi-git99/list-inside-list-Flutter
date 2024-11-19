import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/nested_list_bloc.dart';
import '../../bloc/nested_list_event.dart';
import '../../bloc/nested_list_state.dart';
import '../../model/nested_item_model.dart';
import '../edit_item_screen.dart';

class NestedItemWidget extends StatelessWidget {
  final NestedItem item;

  const NestedItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NestedListBloc, NestedListState>(
      builder: (context, state) {
        final isExpanded = state.toggledItems[item.id] ?? false;

        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  item.title,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade700),
                ),
                subtitle: Text('${item.age} Years Old',
                    style:
                        TextStyle(fontSize: 14.0, color: Colors.grey.shade400)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        CupertinoIcons.square_pencil,
                        size: 20.0,
                      ),
                      onPressed: () {
                        // Navigate to EditItemScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditItemScreen(item: item),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 28.0,
                      ),
                      onPressed: () => context
                          .read<NestedListBloc>()
                          .add(ToggleExpandEvent(item.id)),
                    ),
                  ],
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: item.children
                        .map((child) => NestedItemWidget(item: child))
                        .toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
