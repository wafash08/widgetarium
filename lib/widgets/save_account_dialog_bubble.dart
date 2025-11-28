import 'package:flutter/material.dart';

class SaveAccountDialogBubble extends StatefulWidget {
  const SaveAccountDialogBubble({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  State<SaveAccountDialogBubble> createState() =>
      _SaveAccountDialogBubbleState();
}

class _SaveAccountDialogBubbleState extends State<SaveAccountDialogBubble> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username;
    _passwordController.text = widget.password;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 48,
          right: 12,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // color: const Color(0xFFF2F0EF),
              color: const Color(0xFFECF9FF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          right: 4,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              // color: const Color(0xFFF2F0EF),
              color: const Color(0xFFECF9FF),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 186,
            width: 280,
            padding: EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
            decoration: BoxDecoration(
              // color: const Color(0xFFF2F0EF),
              color: const Color(0xFFECF9FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(64),
                topRight: Radius.circular(64),
                bottomLeft: Radius.circular(64),
                bottomRight: Radius.circular(64),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Simpan Akun', style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                TextField(
                  controller: _usernameController,
                  enabled: false,
                  mouseCursor: SystemMouseCursors.forbidden,
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  decoration: InputDecoration(
                    label: Text(
                      'Nama Pengguna',
                      style: TextStyle(fontSize: 10),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Stack(
                  children: [
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscured,
                      enabled: false,
                      mouseCursor: SystemMouseCursors.forbidden,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      decoration: InputDecoration(
                        label: Text(
                          'Kata Sandi',
                          style: TextStyle(fontSize: 10),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.only(
                          left: 16,
                          top: 12,
                          bottom: 12,
                          right: 48,
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: -4,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                        tooltip: _isObscured ? 'Show' : 'Hide',
                        icon: Icon(
                          _isObscured
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3487a5),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Save', style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
