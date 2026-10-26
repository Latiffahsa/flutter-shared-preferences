import 'package:flutter/material.dart';
import 'providers/user_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProviderWrapper(
      // [UBAH L1] Builder supaya MaterialApp berada DI BAWAH UserProvider
      child: Builder(
        builder: (context) {
          final provider = UserProvider.of(context); // [TAMBAH L1]

          return MaterialApp(
            title: 'State & Preferences',
            debugShowCheckedModeBanner: false,
            themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light, // [TAMBAH L1]
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData( // [TAMBAH L1]
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}