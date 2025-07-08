import 'package:driver_tracker/features/trip_list/model/trip_model.dart';

class TripState {
  final bool isLoading;
  final String? error;
  final List<TripModel> trips;

  TripState({
    required this.isLoading,
    this.error,
    required this.trips,
  });

  factory TripState.initial() => TripState(
    isLoading: false,
    error: null,
    trips: [],
  );

  TripState copyWith({
    bool? isLoading,
    String? error,
    List<TripModel>? trips,
  }) {
    return TripState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      trips: trips ?? this.trips,
    );
  }
}
