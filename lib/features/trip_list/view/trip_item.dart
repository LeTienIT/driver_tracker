import 'package:driver_tracker/core/widgets/show_dialog.dart';
import 'package:driver_tracker/features/trip_list/model/trip_model.dart';
import 'package:driver_tracker/features/trip_list/provider/trip_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class TripItemWidget extends ConsumerWidget{
  TripModel trip;
  Function function;
  TripItemWidget({super.key, required this.trip, required this.function});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(tripProvider.notifier);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row("👤", trip.customTenKhach, isB: true),
            _row("📞", trip.customSdt),
            if (trip.customTtk != null && trip.customTtk!.isNotEmpty)
              _row("ℹ️", trip.customTtk!),
            const SizedBox(height: 4),
            _row("📍 Điểm đón:", trip.customTenDiemDon),
            _row("🏁 Điểm đến:", trip.customTenDiemDen),
            const Divider(height: 16),
            Row(
              children: [
                const Text("📦 Trạng thái: ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  trip.customTrangThai,
                )
              ],
            ),
            const Divider(height: 16),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    final rs = await CustomDialog.showConfirmDialog(
                        context: context,
                        title: 'Thông báo',
                        message: 'Xác nhận bắt đầu hành trình \n Trong quá trình không thể thay đổi'
                    );
                    if(rs){
                      await function();
                    }
                  },
                  child: Text('Hành trình')),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String p, String text, {bool isB = false}){
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Text(p),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                text,
                style: isB? const TextStyle(fontWeight: FontWeight.bold) : null,
              ),
            ),
          ],
        ),
    );
  }
  
}