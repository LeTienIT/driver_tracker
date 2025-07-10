import 'package:driver_tracker/features/auth/view/login_screen.dart';
import 'package:driver_tracker/features/trip_list/view/trip_detail_screen.dart';
import 'package:driver_tracker/features/trip_list/view/trip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'core/dark_theme.dart';
import 'core/light_theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver Tracker',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/trip-list':
            return MaterialPageRoute(builder: (_) => const TripScreen());

          case '/trip-detail':
            final args = settings.arguments as Map<String, dynamic>?;
            if (args == null || args['pickup'] == null || args['dropoff'] == null) {
              // Xử lý khi thiếu arguments
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('Thiếu thông tin vị trí')),
                ),
              );
            }
            return MaterialPageRoute(
              builder: (_) => TripMapScreen(
                tripId: args['tripId'] as int,
                trangThai: args['trangThai'] as String,
                pickup: args['pickup'] as LatLng,
                dropoff: args['dropoff'] as LatLng,
                checkDaDon: args['checkDaDon'] as bool,
              ),
            );

          default:
            return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('Không tìm thấy trang')),
                )
            );
        }
      },
      home: const LoginScreen(),
    );
  }
}
