import 'package:driver_tracker/features/trip_list/provider/trip_provider.dart';
import 'package:driver_tracker/features/trip_list/view/trip_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/permission.dart';

class TripScreen extends ConsumerStatefulWidget {
  const TripScreen({super.key});

  @override
  ConsumerState<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends ConsumerState<TripScreen> {
  final permission = PermissionCustom();

  @override
  void initState() {
    super.initState();
    _handlePermission();
  }

  Future<void> _handlePermission() async {
    final granted = await permission.requestLocationPermission();
    final gpsEnabled = await permission.isGpsEnabled();

    if (!granted || !gpsEnabled) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Yêu cầu quyền truy cập vị trí"),
          content: const Text("Ứng dụng cần quyền vị trí và GPS bật để hoạt động."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Đã hiểu"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(tripProvider.notifier);
    final state = ref.watch(tripProvider);

    if (state.isLoading) return const Center(child: CircularProgressIndicator());
    if (state.error != null) return Center(child: Text("Lỗi: ${state.error}"));

    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách khách hàng')),
      body: ListView.builder(
        itemCount: state.trips.length,
        itemBuilder: (_, idx) {
          final item = state.trips[idx];
          return TripItemWidget(
            trip: item,
            function: () async {
              final (pickupPoint, dropoffPoint) = await vm.getTripDetail(item.name);
              // if (!context.mounted) return;

              if (pickupPoint == null || dropoffPoint == null) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Không có dữ liệu"),
                    content: const Text("Không thể lấy vị trí đón hoặc đến."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK"),
                      )
                    ],
                  ),
                );
                return;
              }

              Navigator.pushNamed(
                context,
                '/trip-detail',
                arguments: {
                  'pickup': pickupPoint,
                  'dropoff': dropoffPoint,
                },
              );
            },
          );
        },
      ),
    );
  }
}
