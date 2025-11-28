import 'package:flutter/material.dart';

class SavedAccoutCard extends StatefulWidget {
  const SavedAccoutCard({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  State<SavedAccoutCard> createState() => _SavedAccoutCardState();
}

class _SavedAccoutCardState extends State<SavedAccoutCard> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        width: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              blurRadius: 0,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Pengguna'),
            const SizedBox(height: 6),
            TextField(
              controller: _usernameController,
              enabled: false,
              mouseCursor: SystemMouseCursors.forbidden,
              style: TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text('Kata Kunci'),
            const SizedBox(height: 6),
            TextField(
              controller: _passwordController,
              obscureText: true,
              obscuringCharacter: '*',
              enabled: false,
              mouseCursor: SystemMouseCursors.forbidden,
              style: TextStyle(color: Colors.black, fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 16,
                  right: 48,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: BorderSide(color: Colors.red.withAlpha(128)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                  ),
                ),
                child: const Text('Delete'),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
