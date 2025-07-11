# driver_tracker

Ứng dụng quản lý ví trị tài xế đưa đón khách hàng

- Ứng dụng call api đến server
- Server trả ra danh sách các khách hàng - Mỗi khách hàng là 1 chuyến đi
  - Bản DEMO NÊN chỉ có 1 khách / 1 chuyến 
  - BÀI TOÁN GIẢI QUYẾT 1-1
- Khi tài ấn bắt đầu 1 hành trính -> api server để lấy điểm đón và đến [GEOLOCATOR]
- Trong suốt quá trình sẽ hiển thị map, tuyến đường đi OSRM + flutter_map
- CỨ 100S sẽ gửi vị trí của tài xế về server 1 lần
- Sau khi đón được khách, tài xế ấn xác nhận để chuyển qua tuyến đường tiếp theo (điểm đến)
  - API thay đổi trạng thái hành trình trong csdl
- Khi hoàn thành -> ấn xác nhận để kết thúc -> QUAY VỀ GIAO DIỆN DANH SÁCH

# BẢN DEMO - không có ứng dụng thực tế - không triển khai dạng sản phẩm vì OSRM free
# GIẢI QUYẾT BÀI TOÁN ĐƯA ĐÓN 1-1 