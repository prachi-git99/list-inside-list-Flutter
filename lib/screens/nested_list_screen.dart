import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/nested_list_bloc.dart';
import '../bloc/nested_list_state.dart';
import 'common_widget/nested_item_widget.dart';

class NestedListScreen extends StatelessWidget {
  const NestedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Details")),
      body: BlocBuilder<NestedListBloc, NestedListState>(
        builder: (context, state) {
          return ListView(
            children: state.items
                .map((item) => NestedItemWidget(item: item))
                .toList(),
          );
        },
      ),
    );
  }
}
