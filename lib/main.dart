import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nested_list_bloc.dart';
import 'screens/nested_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NestedListBloc(),
      child: MaterialApp(
        title: 'Nested List Example',
        debugShowCheckedModeBanner: false,
        home: NestedListScreen(),
      ),
    );
  }
}
