import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oxen_wallet/src/stores/settings/settings_store.dart';
import 'package:oxen_wallet/src/widgets/nav/nav_list_header.dart';

class SettingsHeaderListRow extends StatelessWidget {
  SettingsHeaderListRow({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final settingsStore = Provider.of<SettingsStore>(context);

    return NavListHeader( title: settingsStore.itemHeaders[title] );
  }
}
