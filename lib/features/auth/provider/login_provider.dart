import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/login_vm.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, AsyncValue<bool>>(
      (ref) => LoginViewModel(ref),
);