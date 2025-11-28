import 'package:flutter/material.dart';

class SaveAccountDialog extends StatefulWidget {
  const SaveAccountDialog({
    super.key,
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  State<SaveAccountDialog> createState() => _SaveAccountDialogState();
}

class _SaveAccountDialogState extends State<SaveAccountDialog> {
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
    final double labelWidth = 'Nama Pengguna'.length * 9;

    return Container(
      width: 400,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          _buildCircularWallpaper(
            dimension: 240,
            color: Colors.blue.withAlpha(32),
            top: -40,
            left: -120,
          ),
          _buildCircularWallpaper(
            dimension: 120,
            color: Colors.amber.withAlpha(32),
            top: -40,
            right: -40,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 8,
                    top: 8,
                    bottom: 8,
                  ),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(color: Colors.white.withAlpha(128)),
                  child: Row(
                    spacing: 8,
                    children: [
                      const Icon(
                        Icons.save_as_rounded,
                        color: Color(0xff3487a5),
                      ),
                      const Text('Save Account?'),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        splashRadius: 20,
                        icon: Icon(Icons.close_rounded),
                      ),
                    ],
                  ),
                ),
                // Divider(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    spacing: 8,
                    children: [
                      SizedBox(width: labelWidth, child: Text('Nama Pengguna')),
                      Expanded(
                        child: TextField(
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    spacing: 8,
                    children: [
                      SizedBox(width: labelWidth, child: Text('Kata Kunci')),
                      Expanded(
                        child: Stack(
                          children: [
                            TextField(
                              controller: _passwordController,
                              obscureText: _isObscured,
                              enabled: false,
                              mouseCursor: SystemMouseCursors.forbidden,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
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
                            Positioned(
                              right: 4,
                              top: 2,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                splashRadius: 20,
                                tooltip: _isObscured ? 'Show' : 'Hide',
                                icon: Icon(
                                  _isObscured
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
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
                      child: const Text('Save'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularWallpaper({
    required double dimension,
    required Color color,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: SizedBox.square(
        dimension: dimension,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
