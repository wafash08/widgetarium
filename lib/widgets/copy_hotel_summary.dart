import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CopyHotelSummary extends StatefulWidget {
  const CopyHotelSummary({
    super.key,
    required this.name,
    required this.rating,
    required this.address,
    required this.roomName,
    required this.roomSize,
    required this.checkinDate,
    required this.checkoutDate,
    required this.passengerSize,
    required this.benefits,
    required this.totalPrice,
  });

  final String name;
  final double rating;
  final String address;
  final String roomName;
  final double roomSize;
  final DateTime checkinDate;
  final DateTime checkoutDate;
  final int passengerSize;
  final List<Map<String, String>> benefits;
  final double totalPrice;

  @override
  State<CopyHotelSummary> createState() => _CopyHotelSummaryState();
}

class _CopyHotelSummaryState extends State<CopyHotelSummary> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final String benefit = widget.benefits
        .map((item) {
          return '- ${item['EN']}';
        })
        .join('\n');

    final String text = '''
Ringkasan Hotel:

${widget.name} - ${widget.rating} bintang

${widget.address}

Detail Pemesanan

Room Name: ${widget.roomName}
Room Size: ${widget.roomSize}
Checkin Date : ${widget.checkinDate}
Checkout Date : ${widget.checkoutDate}
Passanger Size : ${widget.roomName}

Benefit :
$benefit

Total Price : ${widget.totalPrice}
''';
    _controller.text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -10,
          top: -10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber.withAlpha(64),
            ),
          ),
        ),
        Positioned(
          left: -60,
          top: -60,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: Colors.blue.withAlpha(64),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50,
              padding: const EdgeInsets.only(left: 16, right: 12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(50),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      spacing: 8,
                      children: [
                        const FaIcon(FontAwesomeIcons.clipboard),
                        const Text('Salin Ringkasan Hotel'),
                      ],
                    ),
                  ),
                  Material(
                    elevation: 0,
                    shape: const CircleBorder(),
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 72,
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: 40,
                      decoration: const InputDecoration(
                        filled: false,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(50, 50, 93, 0.25),
                            blurRadius: 5,
                            spreadRadius: -1,
                            offset: Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 3,
                            spreadRadius: -1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Salin'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
