import 'package:codealpha_flashcard/data_helper/file_provider.dart';
import 'package:codealpha_flashcard/theme/theme_provider.dart';
import 'package:codealpha_flashcard/ui_page/add_new_card_class.dart';
import 'package:codealpha_flashcard/ui_page/home_page.dart';
import 'package:codealpha_flashcard/ui_page/home_page_provider.dart';
import 'package:codealpha_flashcard/ui_page/library_page.dart';
import 'package:codealpha_flashcard/ui_page/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FileProvider()),
        ChangeNotifierProvider(create: (_) => AddCardProvider()),
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;
  final List<Widget> pages = const [HomePage(), LibraryPage(), SettingsPage()];

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,

          /// LIGHT THEME
          theme: provider.lightTheme,

          /// DARK THEME
          darkTheme: provider.darkTheme,
          home: Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),

              child: pages[currentPage],
            ),

            /// BEAUTIFUL BOTTOM NAVIGATION
            bottomNavigationBar: Container(
              margin: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),

                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),

                child: NavigationBar(
                  selectedIndex: currentPage,

                  onDestinationSelected: changePage,

                  height: 75,

                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

                  destinations: const [
                    /// HOME
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),

                      selectedIcon: Icon(Icons.home),

                      label: 'Home',
                    ),

                    /// LIBRARY
                    NavigationDestination(
                      icon: Icon(Icons.menu_book_outlined),

                      selectedIcon: Icon(Icons.menu_book),

                      label: 'Library',
                    ),

                    /// SETTINGS
                    NavigationDestination(
                      icon: Icon(Icons.settings_outlined),

                      selectedIcon: Icon(Icons.settings),

                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
