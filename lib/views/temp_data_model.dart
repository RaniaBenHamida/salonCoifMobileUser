// class ParlourInformation {
//   final String name;
//   final String contact;
//   final String address;
//
//   ParlourInformation({
//     required this.name,
//     required this.contact,
//     required this.address,
//   });
//
//   factory ParlourInformation.fromMap(Map<String, dynamic> map) {
//     return ParlourInformation(
//       name: map['Parlour Name'] ?? '',
//       contact: map['Contact'] ?? '',
//       address: map['Parlour Address'] ?? '',
//     );
//   }
// }
//
// class ServiceInformation {
//   final List<String> services;
//
//   ServiceInformation({required this.services});
//
//   factory ServiceInformation.fromMap(Map<String, dynamic> map) {
//     return ServiceInformation(
//       services: List<String>.from(map['Service Name'] ?? []),
//     );
//   }
// }
//
// class ScheduleInformation {
//   final String date;
//   final String time;
//   final int serialNumber;
//
//   ScheduleInformation({
//     required this.date,
//     required this.time,
//     required this.serialNumber,
//   });
//
//   factory ScheduleInformation.fromMap(Map<String, dynamic> map) {
//     return ScheduleInformation(
//       date: map['Date'] ?? '',
//       time: map['Time'] ?? '',
//       serialNumber: map['Serial Number'] ?? 0,
//     );
//   }
// }
//
// class PaymentInformation {
//   final String mtcnNumber;
//   final String paymentMethod;
//   final double totalServicePrice;
//   final double feesAndCharges;
//   final double totalPayablePrice;
//   final String status;
//
//   PaymentInformation({
//     required this.mtcnNumber,
//     required this.paymentMethod,
//     required this.totalServicePrice,
//     required this.feesAndCharges,
//     required this.totalPayablePrice,
//     required this.status,
//   });
//
//   factory PaymentInformation.fromMap(Map<String, dynamic> map) {
//     return PaymentInformation(
//       mtcnNumber: map['MTCN Number'] ?? '',
//       paymentMethod: map['Payment Method'] ?? '',
//       totalServicePrice: (map['Total Service Price'] ?? 0).toDouble(),
//       feesAndCharges: (map['Fees & Charges'] ?? 0).toDouble(),
//       totalPayablePrice: (map['Total Payable Price'] ?? 0).toDouble(),
//       status: map['Status'] ?? '',
//     );
//   }
// }
//
// class ParlourBooking {
//   final ParlourInformation parlourInfo;
//   final ServiceInformation serviceInfo;
//   final ScheduleInformation scheduleInfo;
//   final PaymentInformation paymentInfo;
//
//   ParlourBooking({
//     required this.parlourInfo,
//     required this.serviceInfo,
//     required this.scheduleInfo,
//     required this.paymentInfo,
//   });
//
//   factory ParlourBooking.fromMap(Map<String, dynamic> map) {
//     return ParlourBooking(
//       parlourInfo: ParlourInformation.fromMap(map['Parlour Information'] ?? {}),
//       serviceInfo: ServiceInformation.fromMap(map['Service Information'] ?? {}),
//       scheduleInfo:
//       ScheduleInformation.fromMap(map['Schedule Information'] ?? {}),
//       paymentInfo: PaymentInformation.fromMap(map['Payment Information'] ?? {}),
//     );
//   }
// }
//
//
