import 'package:equatable/equatable.dart';

abstract class NestedListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleExpandEvent extends NestedListEvent {
  final String id;

  ToggleExpandEvent(this.id);

  @override
  List<Object> get props => [id];
}

class EditItemEvent extends NestedListEvent {
  final String id;
  final String newName;
  final int newAge;

  EditItemEvent(
      {required this.id, required this.newName, required this.newAge});

  @override
  List<Object> get props => [id, newName, newAge];
}
