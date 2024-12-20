import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
//import 'dart:html' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  int _currentIndex = 0;
  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(routeName)];

    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        html.document.title = _pages[index];
      }
    });
  }

  int getPageIndex(String routeName) {
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    // final routeName = _pages[index];
    //solo sirve en web
    html.window.history.pushState(null, 'title', '#/${_pages[index]}');
    //este es con el paquete universal
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
