import 'package:flutter/material.dart';

class HowToPay extends StatefulWidget {
  const HowToPay({super.key});

  @override
  State<HowToPay> createState() => _HowToPayState();
}

class _HowToPayState extends State<HowToPay> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPage = 0;
  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      "Masukkan kartu ATM BRI Anda ke mesin ATM",
      "Masukkan PIN dengan benar",
      "Pilih menu <b>Transfer</b> atau <b>Transfer ke sesama bank</b> jika Anda mentransfer ke sesama BRI",
      "Masukkan nomor rekening tujuan, lalu tekan <b>Benar",
      "Masukkan nominal uang yang akan ditransfer",
      "Periksa kembali detail transaksi. <b>Jika sudah sesuai</b>, pilih <b>Benar</b> atau <b>Ya</b> untuk melanjutkan",
    ];

    final bool prevEnabled = _currentPage > 0;
    final bool nextEnabled = _currentPage < (items.length - 1);

    return Stack(
      children: [
        SafeArea(
          child: Column(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'ATM BRI',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children:
                      items.map((item) {
                        return HowToPayItem(
                          key: ValueKey(item),
                          imageUrl:
                              'https://images.unsplash.com/photo-1556742077-0a6b6a4a4ac4?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          text: item,
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    '${_currentPage + 1}/${items.length}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 8,
                      children: [
                        IconButton(
                          onPressed:
                              prevEnabled
                                  ? () async {
                                    await _pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  : null,
                          tooltip: 'Sebelumnya',
                          icon: Icon(Icons.arrow_back_ios_rounded),
                        ),
                        IconButton(
                          onPressed:
                              nextEnabled
                                  ? () async {
                                    await _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                  : null,
                          tooltip: 'Selanjutnya',
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HowToPayItem extends StatelessWidget {
  const HowToPayItem({super.key, required this.text, required this.imageUrl});

  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.65,
            child: Image(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  child: Center(
                    child: Icon(
                      Icons.image_rounded,
                      size: 120,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16, color: Colors.black87),
                children: _parseHtml(text),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _parseHtml(String html) {
    List<TextSpan> spans = [];
    int i = 0;

    while (i < html.length) {
      if (html[i] == '<') {
        int closeTag = html.indexOf('>', i);
        if (closeTag == -1) break;

        String tag = html.substring(i + 1, closeTag);
        bool isClosing = tag.startsWith('/');
        String tagName = isClosing ? tag.substring(1) : tag;

        if (!isClosing) {
          int endTagStart = html.indexOf('</$tagName>', closeTag);
          if (endTagStart == -1) {
            i = closeTag + 1;
            continue;
          }

          String content = html.substring(closeTag + 1, endTagStart);

          TextStyle style = TextStyle();
          if (tagName == 'b') {
            style = TextStyle(fontWeight: FontWeight.bold);
          } else if (tagName == 'i') {
            style = TextStyle(fontStyle: FontStyle.italic);
          } else if (tagName == 'u') {
            style = TextStyle(decoration: TextDecoration.underline);
          }

          spans.add(TextSpan(text: content, style: style));
          i = endTagStart + tagName.length + 3;
        } else {
          i = closeTag + 1;
        }
      } else {
        int nextTag = html.indexOf('<', i);
        if (nextTag == -1) {
          spans.add(TextSpan(text: html.substring(i)));
          break;
        }
        spans.add(TextSpan(text: html.substring(i, nextTag)));
        i = nextTag;
      }
    }

    return spans;
  }
}
