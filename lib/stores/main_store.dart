// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutterstarter/enums/message_report_level.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:flutterstarter/models/auth/app_data.dart';
import 'package:flutterstarter/models/base_response.dart';
import 'package:flutterstarter/models/message.dart';
import 'package:flutterstarter/services/auth_api.dart';
import 'package:flutterstarter/services/notification_api.dart';
import 'package:flutterstarter/stores/auth_store.dart';
import 'package:flutterstarter/stores/settings_store.dart';
import 'package:flutterstarter/utils/settings_converter.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final authApi = AuthApi();
  final notificationApi = NotificationApi();
  final AuthStore authStore = AuthStore();
  final SettingsStore settingsStore = SettingsConverter.createDefaultSettingsStore();

  AppData? _appData;
  @observable
  ObservableList<Message> messages = ObservableList.of([]);

  @observable
  bool isReady = false;

  @observable
  bool isLoading = false;

  _MainStore() {
    init();
  }

  @action
  Future<void> init() async {
    await loadAppData();
    isReady = true;
  }

  @action
  Future<void> dispose() async {}

  Future<BaseResponse<AppData>> loadAppData() async {
    final response = await authApi.appData();
    _appData = response.data;
    _onAppDataChange(response.data);
    return response;
  }

  Future<void> loadNotifications() async {
    final response = await notificationApi.list();
    addMessages(response.items);
  }

  @action
  void removeMessage(Message message) {
    messages.remove(message);
  }

  @action
  void addMessages(List<Message> list) {
    messages.addAll(list);
  }

  @action
  void addAppError(String label) {
    messages.add(Message(label: label, type: MessageType.app, reportLevel: MessageReportLevel.error));
  }

  @action
  void _onAppDataChange(AppData? appData) {
    final user = appData?.user;

    authStore.user = user;
  }
}
