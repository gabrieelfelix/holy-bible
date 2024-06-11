import 'package:flutter/material.dart';
import 'package:holybible/features/presenter/chapter_page/view/chapter_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChapterPage(),
    );
  }
}
