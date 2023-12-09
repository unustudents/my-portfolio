import 'package:flutter/material.dart';
import 'package:portfolio_me/utils/global_helper.dart';
import 'header.dart';
import '../constants/r.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        width: _width <= 500 ? _width * 2 / 3 : 304,
        child: SafeArea(
          child: Container(
            color: R.colors.background,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItem[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: R.colors.danger,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItem[index].onTap,
                            child: Text(
                              headerItem[index].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItem[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItem.length,
            ),
          ),
        ),
      ),
      backgroundColor: R.colors.background,
      body: Container(
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HeaderView()],
          ),
        ),
      ),
    );
  }
}
