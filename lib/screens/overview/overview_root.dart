import 'package:cashew/models/bill.dart';
import 'package:cashew/screens/bill_screen.dart';
import 'package:cashew/screens/edit_bill_screen.dart';
import 'package:cashew/screens/overview/category_detailed_screen.dart';
import 'package:cashew/screens/overview/overview_screen.dart';
import 'package:flutter/material.dart';

class OverviewRoot extends StatelessWidget {
  const OverviewRoot({Key? key, required this.navigatorKey}) : super(key: key);
  final Key navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return const OverviewScreen();
              case '/bill':
                Bill bill = settings.arguments as Bill;
                return BillScreen(bill: bill);
              case '/editBill':
                Bill bill = settings.arguments as Bill;
                return EditBillScreen(existingBill: bill);
              case '/categoryDetailed':
                return const CategoryDetailedScreen();
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
          },
        );
        // switch (settings.name) {
        //   case '/':
        //     return PageTransition(
        //       child: OverviewScreen(),
        //       type: PageTransitionType.leftToRight,
        //     );
        //   case '/categoryDetailed':
        //     return PageTransition(
        //       child: CategoryDetailedScreen(),
        //       type: PageTransitionType.rightToLeft,
        //     );
        // }
      },
    );
  }
}
