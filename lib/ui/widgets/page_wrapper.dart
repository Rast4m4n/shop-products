import 'package:flutter/material.dart';

import 'package:shop_products/ui/widgets/pageHeader/page_header_widget.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    Key? key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  final Widget body;
  final PreferredSizeWidget? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final isMobile = constraints.maxWidth < 1040;
        if (isMobile) {
          return Scaffold(
            appBar: appBar,
            body: SelectionArea(child: body),
            bottomNavigationBar: bottomNavigationBar,
          );
        } else {
          return Scaffold(
            body: SelectionArea(
              child: Column(
                children: [
                  const PageHeaderWidget(),
                  Expanded(child: SingleChildScrollView(child: body)),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
