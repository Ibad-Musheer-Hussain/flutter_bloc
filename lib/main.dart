import 'package:bloc_practice/bloc/category_bloc.dart';
import 'package:bloc_practice/repo/category_repo.dart';
import 'package:bloc_practice/service/category_service.dart';
import 'package:bloc_practice/ui/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  await Supabase.initialize(
    url: 'https://ivsyhqqficqdxdcfvwui.supabase.co',
    anonKey: dotenv.env['supabase_key']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
            categoryRepo: CategoryRepo(
              categoryService: CategoryService(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
