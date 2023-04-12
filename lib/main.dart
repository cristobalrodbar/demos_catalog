import 'package:demos_catalog/src/models/layout_model.dart';
import 'package:demos_catalog/src/pages/launcher_page.dart';
import 'package:demos_catalog/src/pages/launcher_tablet_page.dart';
import 'package:demos_catalog/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* void main() {
  runApp(MultiProvider(providers: [
    Provider<ThemeChanger>(create: (_) => ThemeChanger(2)),
    Provider<LayoutModel>(create: (_) => LayoutModel())
  ], child: MainApp()));
  //      ChangeNotifierProvider(create: (_) => ThemeChanger(2), child: MainApp()));
} */

void main() => runApp(ChangeNotifierProvider(
    create: (_) => LayoutModel(),
    child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(2), child: MainApp())));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      //theme: ThemeData.dark(),
      title: 'Demos',
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          print('Orientación $orientation');
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          } else {
            return LauncherPage();
          }
        },
      ),
    );
  }
}
