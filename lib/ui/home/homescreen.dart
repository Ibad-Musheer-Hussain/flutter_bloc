import 'package:bloc_practice/bloc/category_bloc.dart';
import 'package:bloc_practice/events/category_events.dart';
import 'package:bloc_practice/state/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is InitialCategoryState) {
              return GestureDetector(
                onTap: () {
                  context.read<CategoryBloc>().add(CategoryLoadEvent());
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Text("Get Categories"),
                ),
              );
            } else if (state is LoadingCategoryState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedCategoryState) {
              return Text(state.data.toString());
            } else
              return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
