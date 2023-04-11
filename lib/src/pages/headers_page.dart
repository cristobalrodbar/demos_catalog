import 'package:demos_catalog/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Scaffold(body: HeaderCurvo(color: accentColor));
  }
}
