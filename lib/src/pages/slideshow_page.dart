import 'package:demos_catalog/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLargeScreen;
    if (MediaQuery.of(context).size.height > 500) {
      isLargeScreen = true;
    } else {
      isLargeScreen = false;
    }

    return Scaffold(
        // backgroundColor: Colors.purple,
        // body: MiSlideshow(),
        body: (isLargeScreen)
            ? Column(
                children: [
                  Expanded(child: MiSlideshow()),
                  Expanded(child: MiSlideshow())
                ],
              )
            : Row(
                children: [
                  Expanded(child: MiSlideshow()),
                  Expanded(child: MiSlideshow())
                ],
              )
        /* Column(
      children: <Widget>[],
    ) */
        );
  }
}

class MiSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario:
          (appTheme.darkTheme) ? accentColor : const Color(0xffFF5A7E),
      // colorSecundario: Colors.red,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
