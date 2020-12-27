import 'package:flutter/material.dart';

class BottomBarNavigation extends ChangeNotifier {
  int _pagesIndex = 0;
  PageController _pageController = new PageController();

  int get pagesIndex => _pagesIndex;
  set pagesIndex(int pagesIndex) {
    _pagesIndex = pagesIndex;
    _pageController.animateToPage(pagesIndex, duration: Duration(milliseconds:500), curve: Curves.ease);
    notifyListeners();
  }

  PageController get pageController => _pageController;

}