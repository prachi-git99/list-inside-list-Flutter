class NestedItem {
  final String id;
  final String title;
  final int age;
  final List<NestedItem> children;

  NestedItem({
    required this.id,
    required this.title,
    required this.age,
    required this.children,
  });

  NestedItem copyWith({
    String? title,
    int? age,
    List<NestedItem>? children,
  }) {
    return NestedItem(
      id: id,
      title: title ?? this.title,
      age: age ?? this.age,
      children: children ?? this.children,
    );
  }
}
