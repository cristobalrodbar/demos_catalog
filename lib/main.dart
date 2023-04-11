import 'package:demos_catalog/src/pages/launcher_page.dart';
import 'package:demos_catalog/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => ThemeChanger(2), child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
        theme: currentTheme,
        //theme: ThemeData.dark(),
        title: 'Demos',
        debugShowCheckedModeBanner: false,
        home: LauncherPage());
  }
}
