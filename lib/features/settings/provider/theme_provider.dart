import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/themeVM.dart';

final themeProvider = NotifierProvider<ThemeNotifier, ThemeState>(() => ThemeNotifier());