// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutterstarter/enums/message_report_level.dart';
import 'package:flutterstarter/enums/message_type.dart';
import 'package:flutterstarter/models/message.dart';
import 'package:flutterstarter/stores/auth_store.dart';
import 'package:flutterstarter/stores/settings_store.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  final AuthStore authStore = AuthStore.makeDefault();
  final SettingsStore settingsStore = SettingsStore.makeDefault();

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
    try {
      isLoading = true;
      await Future.wait([authStore.init(), settingsStore.init()]);
      isReady = true;
    } catch (e) {
      isReady = false;
      addAppError('Error: $e');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> dispose() async {}

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
}
