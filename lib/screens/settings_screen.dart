import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/services/auth_service.dart';
import 'package:flutterstarter/services/setting_api.dart';
import 'package:flutterstarter/widgets/settings/setting_list.dart';
import 'package:flutterstarter/widgets/shared/content_wrapper.dart';
import 'package:flutterstarter/widgets/shared/scaffold_wrapper.dart';
import 'package:flutterstarter/widgets/shared/single_child_scroll_view_full_screen.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  onLogoutClick(BuildContext context) {
    AuthService.logout(context);
  }

  Future<void> changeSetting(AppSettings appSettingsModel, BuildContext context) async {
    context.showLoader();
    await SettingApi().saveSettings(json.encode(appSettingsModel.toJson()));
    if (!context.mounted) return;
    context.hideLoader();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      appBar: AppBar(
        title: Text(context.t('Settings'),
            style: context.titleLarge?.merge(TextStyle(color: context.onPrimary, fontWeight: FontWeight.bold))),
        backgroundColor: context.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: context.appBarIconSize,
          color: context.onPrimary,
          onPressed: () => context.router.back(),
        ),
      ),
      body: SingleChildScrollViewFullScreen(
        child: ContentWrapper(
          child: SettingList(changeSetting: changeSetting, onLogoutClick: onLogoutClick),
        ),
      ),
    );
  }
}
