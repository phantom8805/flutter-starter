import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/models/settings/app_settings.dart';
import 'package:flutterstarter/utils/settings_converter.dart';
import 'package:flutterstarter/widgets/settings/setting_dropdown.dart';
import 'package:flutterstarter/widgets/settings/setting_headline.dart';
import 'package:flutterstarter/widgets/settings/setting_label.dart';
import 'package:flutterstarter/widgets/settings/setting_section.dart';
import 'package:flutterstarter/widgets/settings/setting_section_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingList extends StatelessWidget {
  final Future<void> Function(AppSettings appSettingsModel, BuildContext context) changeSetting;
  final void Function(BuildContext context) onLogoutClick;

  const SettingList({super.key, required this.changeSetting, required this.onLogoutClick});

  AppSettings _getAppSettingsModel(BuildContext context) {
    return SettingsConverter.getAppSettingsFromStore(context.storeNonListened.settingsStore);
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    context.showLoader();
    try {
      await launchUrl(Uri.parse(url));
      if (!context.mounted) return;
    } finally {
      context.hideLoader();
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsStore = context.store.settingsStore;

    final defaultIconBackground = context.primary;

    return Observer(builder: (context) {
      return Column(
        children: <Widget>[
          SettingSection(headline: const SettingHeadline(text: 'Visual'), items: [
            SettingSectionItem(rowItems: [
              SettingLabel(
                text: 'Larger Text',
                icon: Icons.format_size_sharp,
                iconBackground: defaultIconBackground,
                maxWidth: context.percentWidth(35),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: context.percentWidth(45)),
                child: SettingDropdown<ScaleSize>(
                  value: settingsStore.scaleSize,
                  items: ScaleSize.values.map((ScaleSize value) {
                    return DropdownMenuItem<ScaleSize>(
                      value: value,
                      child: Text(context.t(value.label)),
                    );
                  }).toList(),
                  onChange: (val) async {
                    final appSettingsModel = _getAppSettingsModel(context);
                    appSettingsModel.scaleSize = val;
                    await changeSetting(appSettingsModel, context);
                    settingsStore.scaleSize = val;
                  },
                ),
              ),
            ])
          ]),
          SettingSection(headline: const SettingHeadline(text: 'Account'), items: [
            SettingSectionItem(onTap: () => onLogoutClick(context), rowItems: [
              SettingLabel(text: 'Logout', icon: Icons.logout, iconBackground: context.danger),
            ])
          ]),
        ],
      );
    });
  }
}
