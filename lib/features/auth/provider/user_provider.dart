import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/driver_user.dart';

final currentUserProvider = StateProvider<DriverUser?>((ref) => null);