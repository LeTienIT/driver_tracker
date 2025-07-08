import 'package:driver_tracker/features/trip_list/provider/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TripScreen extends ConsumerWidget{
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(tripProvider.notifier);
    final state = ref.watch(tripProvider);

    if (state.isLoading) return const CircularProgressIndicator();

    if (state.error != null) return Text("Lỗi: ${state.error}");

    throw UnimplementedError();
  }


}