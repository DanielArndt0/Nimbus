import 'package:flutter/material.dart';
import 'package:nimbus/App/AppColors.dart';

class NavDrawer extends StatelessWidget {
  final void Function()? home;
  final void Function()? profile;
  final void Function()? storage;
  final void Function()? help;
  final void Function()? about;
  final void Function()? exit;
  final void Function()? version;
  const NavDrawer({
    this.home,
    this.profile,
    this.storage,
    this.help,
    this.about,
    this.exit,
    this.version,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: [_buildMenuItens(context)]));
  }
}

Widget _buildMenuItens(BuildContext context) {
  return SingleChildScrollView(
    padding: EdgeInsets.only(top: 50 + MediaQuery.of(context).padding.top),
    child: Wrap(
      runSpacing: 10,
      children: [
        _listItem('Home', trailing: true),
        _listItem('Profile', trailing: true),
        _listItem('Storage', trailing: true),
        _listItem('Settings', trailing: true),
        _listItem('Help', trailing: true),
        _listItem('About', trailing: true),
        _listItem('Logout'),
        _listItem('Version'),
      ],
    ),
  );
}

Widget _listItem(String title, {void Function()? onTap, bool? trailing}) {
  return ListTile(
    trailing:
        (trailing ?? false) == false ? null : Icon(Icons.arrow_right_rounded),
    title: Text(
      title,
      style: TextStyle(color: AppColors.fontColor, fontSize: 16),
    ),
    onTap: onTap,
  );
}
