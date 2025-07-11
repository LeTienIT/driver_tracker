import 'package:driver_tracker/features/auth/provider/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/auth_repository.dart';

class LoginViewModel extends StateNotifier<AsyncValue<bool>> {
  LoginViewModel(this.ref) : super(const AsyncData(false));

  final Ref ref;
  final _repo = AuthRepository();

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final (success, user) = await _repo.login(email, password); //trả về true/false
      if (success && user != null) {
        ref.read(currentUserProvider.notifier).state = user;
        final preferences = await SharedPreferences.getInstance();
        final loginAuto = preferences.getBool('loginAuto') ?? false;
        if(!loginAuto){
          await preferences.setBool('loginAuto', true);
          await preferences.setString('user', email);
          await preferences.setString('pass', password);
        }
        state = AsyncData(success);
      }
      else{
        state = AsyncData(success);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
