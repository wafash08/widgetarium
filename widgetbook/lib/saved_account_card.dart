import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/saved_accout_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SavedAccoutCard)
Widget buildSavedAccountCard(BuildContext context) {
  return SavedAccoutCard(password: '123456', username: 'tanva0001u025');
}

@widgetbook.UseCase(name: 'List', type: SavedAccoutCard)
Widget buildSavedAccountList(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 40, bottom: 40),
    child: SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Text('Daftar akun tersimpan', style: TextStyle(fontSize: 18)),
          Column(
            spacing: 20,
            children: [
              SavedAccoutCard(password: '123456', username: 'tanva0001u025'),
              SavedAccoutCard(password: '123456', username: 'tanva0001u025'),
              SavedAccoutCard(password: '123456', username: 'tanva0001u025'),
            ],
          ),
        ],
      ),
    ),
  );
}
