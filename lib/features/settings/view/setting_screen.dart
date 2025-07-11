import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/menu.dart';
import '../provider/theme_provider.dart';
import '../view_model/themeVM.dart';

class SettingScreen extends ConsumerStatefulWidget{
  SettingScreen({super.key});


  @override
  ConsumerState<SettingScreen> createState() {
    return _SettingScreen();
  }
}

class _SettingScreen extends ConsumerState<SettingScreen>{
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    var light = theme.isDark;
    return Scaffold(
      appBar: AppBar(title: Text('Cài đặt',)),
      drawer: Drawer(child: Menu(),),
      body: ListView(
          children: [
            ExpansionTile(
              initiallyExpanded: true,
              leading: Icon(Icons.palette),
              title: Text('Giao diện'),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: SwitchListTile(
                      title: Text('Chế độ nền tối',),
                      value: light,
                      onChanged: (bool value){
                        ref.read(themeProvider.notifier).setTheme(value);
                      },
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveTrackColor: Theme.of(context).colorScheme.surfaceContainerHighest
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

}