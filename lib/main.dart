import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_x/features/main/main_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff000356),
          primary: Color(0xff000356),
          secondary: Color(0xfffefefe),
        ),
        scaffoldBackgroundColor: Color(0xfffefefe),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xffeeeeee),
          selectedItemColor: Color(0xff000356),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),

        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade200,
          selectedColor: Color(0xff000356),
          labelStyle: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          secondaryLabelStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          secondarySelectedColor: Color(0xff000356),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff000356),
          foregroundColor: Color(0xfffefefe),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Color(0xff000356),
            foregroundColor: Color(0xfffefefe),
            disabledBackgroundColor: Colors.grey.shade400,
            disabledForegroundColor: Colors.white70,
            fixedSize: const Size.fromHeight(56),

            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardThemeData(
          margin: EdgeInsets.zero,
          color: Color(0xfff2f2f2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 1,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xfffefefe),
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          iconTheme: const IconThemeData(color: Colors.black87),
          titleTextStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: MainScreen(),
    );
  }
}
