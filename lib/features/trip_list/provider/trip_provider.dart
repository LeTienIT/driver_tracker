import 'package:driver_tracker/features/auth/provider/user_provider.dart';
import 'package:driver_tracker/features/trip_list/model/trip_state.dart';
import 'package:driver_tracker/features/trip_list/view_model/trip_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tripProvider = StateNotifierProvider<TripVM, TripState>(
    (ref){
      final user = ref.watch(currentUserProvider);
      if (user == null) {
        throw Exception('Chưa đăng nhập');
      }
      return TripVM(ref, user!.id)..getTrips()..updateLocationLogin();
    }
);