import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/share_pre.dart';

class ThemeState {
  final bool isDark;
  final bool isLoad;

  ThemeState({required this.isDark, required this.isLoad});

  ThemeState copyWith({bool? isDark, bool? isLoad}) {
    return ThemeState(
      isDark: isDark ?? this.isDark,
      isLoad: isLoad ?? this.isLoad,
    );
  }
}

class ThemeNotifier extends Notifier<ThemeState> {
  @override
  ThemeState build() {
    final isDark = SharedPreference.instance.getValue<bool>('isDark') ?? false;
    return ThemeState(isDark: isDark, isLoad: true);
  }

  void setTheme(bool value) {
    SharedPreference.instance.setValue<bool>('isDark', value);
    state = state.copyWith(isDark: value);
  }
}