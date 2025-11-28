import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgetarium/widgets/copy_hotel_summary.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Future<void> showCopyHotelSummary(
  BuildContext context, {
  bool isMobile = false,
}) async {
  if (isMobile) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black12,
      isDismissible: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: CopyHotelSummary(
            address:
                'Jl. Prajurit KKO Usman dan Harun No.44-48, RT.7/RW.1, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110',
            benefits: [
              {"EN": "ROOM ONLY", "ID": "HANYA KAMAR"},
              {"EN": "ROOM ONLY 2", "ID": "HANYA KAMAR 2"},
            ],
            checkinDate: DateTime.now(),
            checkoutDate: DateTime.now(),
            name: 'Aryaduta Jakarta',
            passengerSize: 2,
            rating: 4,
            roomName: 'Superior',
            roomSize: 2,
            totalPrice: 1061934,
          ),
        );
      },
    );
  } else {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: 'copyHotelSummary',
      barrierDismissible: true,
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (_, __, ___) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: 400,
            child: CopyHotelSummary(
              address:
                  'Jl. Prajurit KKO Usman dan Harun No.44-48, RT.7/RW.1, Gambir, Kecamatan Gambir, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10110',
              benefits: [
                {"EN": "ROOM ONLY", "ID": "HANYA KAMAR"},
                {"EN": "ROOM ONLY 2", "ID": "HANYA KAMAR 2"},
              ],
              checkinDate: DateTime.now(),
              checkoutDate: DateTime.now(),
              name: 'Aryaduta Jakarta',
              passengerSize: 2,
              rating: 4,
              roomName: 'Superior',
              roomSize: 2,
              totalPrice: 1061934,
            ),
          ),
        );
      },
    );
  }
}

@widgetbook.UseCase(name: 'Desktop', type: CopyHotelSummary)
Widget buildCopyHotelSummaryDesktop(BuildContext context) {
  return IconButton(
    onPressed: () {
      showCopyHotelSummary(context, isMobile: false);
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}

@widgetbook.UseCase(name: 'Mobile', type: CopyHotelSummary)
Widget buildCopyHotelSummaryMobile(BuildContext context) {
  return IconButton(
    onPressed: () {
      showCopyHotelSummary(context, isMobile: true);
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}
