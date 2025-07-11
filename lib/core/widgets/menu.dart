import 'package:driver_tracker/features/auth/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends ConsumerWidget{
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(currentUserProvider);
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          'Menu',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            children: [
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                margin: EdgeInsets.all(10),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        state!.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                    ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Danh sách hành trình'),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/trip-list', (route) => false),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cài đặt giao diện'),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/setting', (route) => false),
              ),

              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();

                    await prefs.remove('user');
                    await prefs.remove('pass');
                    await prefs.setBool('loginAuto', false);
                    ref.read(currentUserProvider.notifier).state = null;
                    Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login',
                        (route) => false
                    );
                  },
                  child: Text("Đăng xuất")
              )
            ],
          ),
        )
      ],
    );
  }


}