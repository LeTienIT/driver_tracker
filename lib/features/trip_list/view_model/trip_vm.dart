import 'package:driver_tracker/features/trip_list/model/trip_model.dart';
import 'package:driver_tracker/features/trip_list/model/trip_state.dart';
import 'package:driver_tracker/features/trip_list/repository/trip_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripVM extends StateNotifier<TripState>{
  TripVM(this.ref,this.email) : super(TripState.initial());

  final Ref ref;
  final String email;
  final _repo = TripRepository();

  Future<void> getTrips() async{
    state = state.copyWith(isLoading: true);
    try{
      final rs = await _repo.getAllData(email);
      state = state.copyWith(isLoading: false, trips: rs);
    }catch(e){
      state = state.copyWith(isLoading: false,error: e.toString());
    }
  }

}