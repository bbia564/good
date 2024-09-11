import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/db_say/db_say.dart';
import 'package:good_say/pages/say_one/myself_type_list/myself_type_list_binding.dart';
import 'package:good_say/pages/say_one/myself_type_list/myself_type_list_view.dart';
import 'package:good_say/pages/say_one/say_add/say_add_binding.dart';
import 'package:good_say/pages/say_one/say_add/say_add_view.dart';
import 'package:good_say/pages/say_one/say_one_binding.dart';
import 'package:good_say/pages/say_one/say_one_view.dart';
import 'package:good_say/pages/say_poi/say_po_binding.dart';
import 'package:good_say/pages/say_poi/say_po_view.dart';
import 'package:good_say/pages/say_tab/say_tab_binding.dart';
import 'package:good_say/pages/say_tab/say_tab_view.dart';
import 'package:good_say/pages/say_two/say_two_binding.dart';
import 'package:good_say/pages/say_two/say_two_view.dart';

import 'db_say/tool_say.dart';

Color primaryColor = const Color(0xffffe05f);
Color bgColor = const Color(0xfffcfcfc);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBSay().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: SayLists,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> SayLists = [
  GetPage(name: '/', page: () => const SayPoView(),binding: SayPoBinding()),
  GetPage(name: '/sayTabPage', page: () => SayTabPage(),binding: SayTabBinding()),
  GetPage(name: '/sayPo', page: () => const SayTol()),
  GetPage(name: '/sayOnePage', page: () => SayOnePage(),binding: SayOneBinding()),
  GetPage(name:'/sayTwoPage', page: () => SayTwoPage(),binding: SayTwoBinding()),
  GetPage(name: '/myselfTypeListPage', page: () => MyselfTypeListPage(),binding: MyselfTypeListBinding()),
  GetPage(name: '/sayAddPage', page: () => SayAddPage(),binding: SayAddBinding())
];