import 'package:flutter/material.dart';
import 'package:misteria/widgets/page/home_page.dart';
import 'package:misteria/widgets/tema.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mysterIA",
      theme: temaAtual(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
