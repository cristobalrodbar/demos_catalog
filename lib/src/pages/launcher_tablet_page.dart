import 'package:demos_catalog/src/pages/slideshow_page.dart';
import 'package:demos_catalog/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demos_catalog/src/routes/routes.dart';
import 'package:provider/provider.dart';

import '../models/layout_model.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.currentTheme.colorScheme.secondary,
          title: Text('diseños en flutter - tablet'),
        ),
        drawer: _MenuPrincipal(),
        body: //_ListaOpciones()
            Row(
          children: [
            Container(
                width: 300, height: double.infinity, child: _ListaOpciones()
                //color: Colors.red,
                ),
            Container(
              width: 1,
              height: double.infinity,
              color: (appTheme.darkTheme)
                  ? Colors.grey
                  : appTheme.currentTheme.colorScheme.secondary,
            ),
            Expanded(child: layoutModel.currentPage)
          ],
        ));
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'CR',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),
              Expanded(child: _ListaOpciones()),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: accentColor),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  },
                  activeColor: accentColor,
                ),
              ),
              SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color: accentColor),
                  title: Text('Custom Mode'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    },
                    activeColor: accentColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
        separatorBuilder: (context, index) =>
            Divider(color: appTheme.primaryColorLight),
        itemCount: pageRoutes.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, i) => ListTile(
              leading: FaIcon(
                pageRoutes[i].icon,
                color: appTheme.colorScheme.secondary,
              ),
              title: Text(pageRoutes[i].titulo),
              trailing: Icon(Icons.chevron_right,
                  color: appTheme.colorScheme.secondary),
              onTap: () {
                final layoutModel =
                    Provider.of<LayoutModel>(context, listen: false);
                layoutModel.currentPage = pageRoutes[i].page;

                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => pageRoutes[i].page)); */
              },
            ));
  }
}
