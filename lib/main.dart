import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:fyp_admin_panel/views/screens/inner_screens/buyers_screen.dart';
import 'package:fyp_admin_panel/views/screens/inner_screens/category_screen.dart';
import 'package:fyp_admin_panel/views/screens/inner_screens/order_scree.dart';
import 'package:fyp_admin_panel/views/screens/inner_screens/upload_banner_screen.dart';
import 'package:fyp_admin_panel/views/screens/upload_product_screen.dart';
import 'package:fyp_admin_panel/views/screens/vendors_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ?const  FirebaseOptions(
        apiKey: "AIzaSyAsGM1Wr20TP1CHHVpsh5eJivoauuNoOoo",
        appId: "1:942625397200:web:2985f17cdec962f9bac1d5",
        messagingSenderId: "942625397200",
        projectId: "homecheffoodlink",
        storageBucket: "homecheffoodlink.appspot.com",
      )
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: SideMenu(),
    );
  }
}

class SideMenu extends StatefulWidget {
  static const String id = '\sideMenu';

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Widget _selectedScreen = CategoryScreen();

  screnSelectore(item) {
    switch (item.route) {
      case CategoryScreen.id:
        setState(() {
          _selectedScreen = CategoryScreen();
        });

      case VendorsScreen.routeName:
        setState(() {
          _selectedScreen = VendorsScreen();
        });

        break;

      case BuyersScreen.routeName:
        setState(() {
          _selectedScreen = BuyersScreen();
        });

        break;

      case OrderScreen.routeName:
        setState(() {
          _selectedScreen = OrderScreen();
        });

        break;

      case UploadBanners.id:
        setState(() {
          _selectedScreen = UploadBanners();
        });

        break;

      case ProductUploadPage.id:
        setState(() {
          _selectedScreen = ProductUploadPage();
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Vendors',
            route: VendorsScreen.routeName,
            icon: CupertinoIcons.person_3,
          ),
          AdminMenuItem(
            title: 'Buyers',
            route: BuyersScreen.routeName,
            icon: CupertinoIcons.person,
          ),
          // AdminMenuItem(
          //   title: 'Withdrawal',
          //   route: WithrawalScreen.id,
          //   icon: CupertinoIcons.money_dollar,
          // ),
          AdminMenuItem(
            title: 'Orders',
            route: OrderScreen.routeName,
            icon: CupertinoIcons.shopping_cart,
          ),
          AdminMenuItem(
            title: 'Categories',
            icon: Icons.category_rounded,
            route: CategoryScreen.id,
          ),

          AdminMenuItem(
            title: 'Upload Banner',
            icon: CupertinoIcons.add,
            route: UploadBanners.id,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: CupertinoIcons.shopping_cart,
            route: ProductUploadPage.id,
          ),
        ],
        selectedRoute: CategoryScreen.id,
        onSelected: (item) {
          screnSelectore(item);

          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: Colors.black,
          child: const Center(
            child: Text(
              'HomeChef Admin ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedScreen,
    );
  }
}
