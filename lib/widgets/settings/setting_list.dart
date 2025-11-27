import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterstarter/enums/scale_size.dart';
import 'package:flutterstarter/extensions/build_context_extensions.dart';
import 'package:flutterstarter/services/auth_service.dart';
import 'package:flutterstarter/services/settings_service.dart';
import 'package:flutterstarter/widgets/settings/setting_dropdown.dart';
import 'package:flutterstarter/widgets/settings/setting_headline.dart';
import 'package:flutterstarter/widgets/settings/setting_label.dart';
import 'package:flutterstarter/widgets/settings/setting_section.dart';
import 'package:flutterstarter/widgets/settings/setting_section_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  void onLogoutClick(BuildContext context) {
    AuthService.logout(context);
  }

  Future<void> saveSetting(BuildContext context) async {
    context.showLoader();
    await SettingsService.updateSettings(context);
    if (!context.mounted) return;
    context.hideLoader();
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
    final settingsStoreWriteable = context.storeNonListened.settingsStore;

    final defaultIconBackground = context.primary;

    return Observer(
      builder: (context) {
        return Column(
          children: <Widget>[
            SettingSection(
              headline: const SettingHeadline(text: 'Visual'),
              items: [
                SettingSectionItem(
                  rowItems: [
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
                          return DropdownMenuItem<ScaleSize>(value: value, child: Text(context.t(value.label)));
                        }).toList(),
                        onChange: (val) {
                          settingsStoreWriteable.scaleSize = val;
                          saveSetting(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SettingSection(
              headline: const SettingHeadline(text: 'Account'),
              items: [
                SettingSectionItem(
                  onTap: () => onLogoutClick(context),
                  rowItems: [SettingLabel(text: 'Logout', icon: Icons.logout, iconBackground: context.danger)],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
