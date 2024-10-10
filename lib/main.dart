import 'package:flutter/foundation.dart';
import 'package:hyper_supabase/module/inventory/inventory_login/view/inventory_login_view.dart';
import 'package:hyper_supabase/state_util.dart';
import 'package:hyper_supabase/core.dart';
import 'package:flutter/material.dart';
import 'package:hyper_supabase/setup_menu.dart';

// https://res.cloudinary.com/dotz74j1p/raw/upload/v1716046071/lav8q7oo72hn1kdbtggm.png
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSupabase();
  await Diointerceptors.init();
  await DBService.init();

  await AuthService().logout();

  await AuthService().initializeUserDataIfLoggedIn();
  client.rpc('product_stock_report', params: {}).asStream().listen(
        (event) {
          printo("product_stock_report: ${event}");
        },
      );
  // client.rpc('product_stock_report').exec().then((value) {
  //   printo(value);
  //   printg(value);
  // });

  // await UserProfileService().deleteAll();

  // var users = await UserProfileService().getAll();
  // for (var user in users) {
  //   print(user["_id"] + " >> " + user["email"]);
  // }
  runMainApp();
}

runMainApp() async {
  return runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setupMenu();
    return MaterialApp(
      title: 'Capek Ngoding',
      navigatorKey: Get.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: isLoggedIn ? WebMainNavigationView() : LoginView(),
      home: isLoggedIn ? InventoryHomeView() : InventoryLoginView(),
      onGenerateRoute: (routeSettings) {
        print(routeSettings.name);
        return null;
      },
      builder: (context, child) {
        if (!kDebugMode) return child!;
        return DevBuilder(
          child: child,
        );
      },
    );
  }
}
