import 'package:driver_tracker/features/trip_list/model/trip_model.dart';
import 'package:driver_tracker/features/trip_list/model/trip_state.dart';
import 'package:driver_tracker/features/trip_list/repository/trip_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class TripVM extends StateNotifier<TripState>{
  TripVM(this.ref,this.email) : super(TripState.initial());

  final Ref ref;
  final int email;
  final _repo = TripRepository();

  Future<void> getTrips() async{
    state = state.copyWith(isLoading: true);
    try{
      final rs = await _repo.getAllData(email);
      // print("getdata ${rs.length}");
      state = state.copyWith(isLoading: false, trips: rs);
    }catch(e){
      state = state.copyWith(isLoading: false,error: e.toString());
    }
  }

  Future<void> updateLocationLogin({bool loading = true}) async {
    final pos = await getCurrentPosition();
    if(loading) {
      state = state.copyWith(isLoading: true);
      try{
        await _repo.updateLocation(email, pos.latitude, pos.longitude);
        state = state.copyWith(isLoading: false);
      }catch(e){
        state = state.copyWith(isLoading: false,error: e.toString());
      }
    }
    else{
      await _repo.updateLocation(email, pos.latitude, pos.longitude);
    }
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("GPS chưa bật");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Không được cấp quyền vị trí");
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> updateStatusTrip(int id, String s)async {
    state = state.copyWith(isLoading: true);
    try{
      await _repo.updateStateTrip(id, s);
      final updatedTrips = state.trips.map((trip) {
        if (trip.name == id) {
          return trip.copyWith(customTrangThai: s);
        }
        return trip;
      }).toList();

      state = state.copyWith(isLoading: false, trips: updatedTrips);
    }catch(e){
      state = state.copyWith(isLoading: false,error: e.toString());
    }
  }

  Future<void> updateStatusDriver(String s)async {
    state = state.copyWith(isLoading: true);
    try{
      await _repo.updateStateDrive(email, s);
      state = state.copyWith(isLoading: false);
    }catch(e){
      state = state.copyWith(isLoading: false,error: e.toString());
    }
  }

  Future<(LatLng?, LatLng?)> getTripDetail(int id) async{
    state = state.copyWith(isLoading: true);
    try{
      final res = await _repo.getTripDetail(id);
      // print("res get detail: $res");
      state = state.copyWith(isLoading: false);
      return res;
    }catch(e){
      state = state.copyWith(isLoading: false,error: e.toString());
      return (null, null);
    }
  }
}