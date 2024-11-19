import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/nested_item_model.dart';
import 'nested_list_event.dart';
import 'nested_list_state.dart';

class NestedListBloc extends Bloc<NestedListEvent, NestedListState> {
  NestedListBloc() : super(NestedListState.initial()) {
    on<ToggleExpandEvent>((event, emit) {
      final updatedState = state.copyWith(
        toggledItems: Map.from(state.toggledItems)
          ..update(
            event.id,
            (value) => !value,
            ifAbsent: () => true,
          ),
      );
      emit(updatedState);
    });

    on<EditItemEvent>((event, emit) {
      final updatedItems = state.items.map((item) {
        return _updateItem(item, event);
      }).toList();

      emit(state.copyWith(items: updatedItems));
    });
  }

  NestedItem _updateItem(NestedItem item, EditItemEvent event) {
    if (item.id == event.id) {
      return item.copyWith(title: event.newName, age: event.newAge);
    }
    return item.copyWith(
      children:
          item.children.map((child) => _updateItem(child, event)).toList(),
    );
  }
}
