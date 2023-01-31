import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/provider/provider_list.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        title: 'Generate QR Code',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
