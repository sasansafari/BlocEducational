import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:BlocAPi/home.dart';

import 'repository/repositorys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //ریپازیتوری پرووایدر شرایطی رو فراهم میکنه که بتونسیم در اجرای ا.ولیه داده های رو از ریپازیتوری دریافت و مقدار دهی کنیم
        //ریپازیتوری پروایدر برای یک بار داده ها را از سرور میگیرد
        home: RepositoryProvider(
      create: (BuildContext context) => Repository(),
      child: const Scaffold(
        body: Home(),
      ),
    ));
  }
}
