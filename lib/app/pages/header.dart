import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_me/utils/global_helper.dart';
import 'package:portfolio_me/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../constants/r.dart';
import '../models/header_model.dart';

List<HeaderModel> headerItem = [
  HeaderModel(title: 'HOME', onTap: () {}),
  HeaderModel(title: 'PROFIL', onTap: () {}),
  HeaderModel(title: 'SERVICE', onTap: () {}),
  HeaderModel(title: 'PORTFOLIO', onTap: () {}),
  HeaderModel(title: 'TESTIMONI', onTap: () {}),
  HeaderModel(title: 'BLOGS', onTap: () {}),
  HeaderModel(title: 'HIME ME', onTap: () {}, isButton: true),
];

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: buildHeader(),
      ),
      mobile: buildHeaderMobile(),
      tablet: buildHeader(),
    );
  }

  Widget buildHeaderMobile() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState!.openEndDrawer();
              },
              child: const Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [logo(), menu()],
      ),
    );
  }

  logo() => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'M',
                  style: GoogleFonts.oswald(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '.',
                  style: GoogleFonts.oswald(
                    color: R.colors.primary,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  menu() => ResponsiveVisibility(
        visible: false,
        visibleConditions: [Condition.largerThan(value: true, name: MOBILE)],
        child: Row(
          children: headerItem
              .map(
                (item) => item.isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: R.colors.danger,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: TextButton(
                            onPressed: item.onTap,
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          margin: const EdgeInsets.only(right: 30.0),
                          child: GestureDetector(
                            onTap: item.onTap,
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
              )
              .toList(),
        ),
      );
}
