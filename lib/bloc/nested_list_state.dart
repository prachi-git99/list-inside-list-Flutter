import 'package:equatable/equatable.dart';

import '../model/nested_item_model.dart';

class NestedListState extends Equatable {
  final List<NestedItem> items;
  final Map<String, bool> toggledItems;

  NestedListState({required this.items, required this.toggledItems});

  factory NestedListState.initial() {
    return NestedListState(
      items: [
        NestedItem(
          id: '1',
          title: 'John Doe',
          age: 40,
          children: [
            NestedItem(
              id: '1.1',
              title: 'Jane Smith',
              age: 35,
              children: [
                NestedItem(
                  id: '1.1.1',
                  title: 'Emily Johnson',
                  age: 15,
                  children: [
                    NestedItem(
                      id: '1.1.1.1',
                      title: 'Liam Brown',
                      age: 5,
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        NestedItem(
          id: '2',
          title: 'Alice Williams',
          age: 50,
          children: [
            NestedItem(
              id: '2.1',
              title: 'Bob Taylor',
              age: 30,
              children: [
                NestedItem(
                  id: '2.1.1',
                  title: 'Charlie Davis',
                  age: 12,
                  children: [
                    NestedItem(
                      id: '2.1.1.1',
                      title: 'Liam Brown',
                      age: 5,
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
      toggledItems: {},
    );
  }

  NestedListState copyWith({
    List<NestedItem>? items,
    Map<String, bool>? toggledItems,
  }) {
    return NestedListState(
      items: items ?? this.items,
      toggledItems: toggledItems ?? this.toggledItems,
    );
  }

  @override
  List<Object> get props => [items, toggledItems];
}
