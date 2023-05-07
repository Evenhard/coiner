import 'package:crypto_app/pages/empty.dart';
import 'package:crypto_app/pages/home.dart';
import 'package:crypto_app/resources/app_colors.dart';
import 'package:crypto_app/resources/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    EmptyPage(),
    EmptyPage(),
    EmptyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Container(
      color: const Color(0xFFF8F9FA),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          elevation: 5,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          //backgroundColor: Colors.green, //Colors.white,
          selectedItemColor: AppColors.SELECTED_COLOR,
          unselectedItemColor: AppColors.UNSELECTED_COLOR,
          type: BottomNavigationBarType.fixed,
          onTap: (e) {
            setState(() {
              _currentIndex = e;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: const EdgeInsets.only(
                    top: AppDimens.BOTTOMMENU_ICON_PADDING),
                child: SvgPicture.asset(
                  'assets/icons/menu_1.svg',
                  height: 22,
                  color: _currentIndex == 0
                      ? AppColors.SELECTED_COLOR
                      : AppColors.UNSELECTED_COLOR,
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: const EdgeInsets.only(
                    top: AppDimens.BOTTOMMENU_ICON_PADDING),
                child: SvgPicture.asset(
                  'assets/icons/menu_2.svg',
                  height: 22,
                  color: _currentIndex == 1
                      ? AppColors.SELECTED_COLOR
                      : AppColors.UNSELECTED_COLOR,
                ),
              ),
              label: 'Рынок',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: const EdgeInsets.only(
                    top: AppDimens.BOTTOMMENU_ICON_PADDING),
                child: SvgPicture.asset(
                  'assets/icons/menu_3.svg',
                  height: 22,
                  color: _currentIndex == 2
                      ? AppColors.SELECTED_COLOR
                      : AppColors.UNSELECTED_COLOR,
                ),
              ),
              label: 'Портфолио',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Padding(
                padding: const EdgeInsets.only(
                    top: AppDimens.BOTTOMMENU_ICON_PADDING),
                child: SvgPicture.asset(
                  'assets/icons/menu_4.svg',
                  height: 22,
                  color: _currentIndex == 3
                      ? AppColors.SELECTED_COLOR
                      : AppColors.UNSELECTED_COLOR,
                ),
              ),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
