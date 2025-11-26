// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainStore on _MainStore, Store {
  late final _$messagesAtom = Atom(
    name: '_MainStore.messages',
    context: context,
  );

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$isReadyAtom = Atom(name: '_MainStore.isReady', context: context);

  @override
  bool get isReady {
    _$isReadyAtom.reportRead();
    return super.isReady;
  }

  @override
  set isReady(bool value) {
    _$isReadyAtom.reportWrite(value, super.isReady, () {
      super.isReady = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_MainStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$initAsyncAction = AsyncAction(
    '_MainStore.init',
    context: context,
  );

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$disposeAsyncAction = AsyncAction(
    '_MainStore.dispose',
    context: context,
  );

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  late final _$_MainStoreActionController = ActionController(
    name: '_MainStore',
    context: context,
  );

  @override
  void removeMessage(Message message) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
      name: '_MainStore.removeMessage',
    );
    try {
      return super.removeMessage(message);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessages(List<Message> list) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
      name: '_MainStore.addMessages',
    );
    try {
      return super.addMessages(list);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAppError(String label) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
      name: '_MainStore.addAppError',
    );
    try {
      return super.addAppError(label);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _onAppDataChange(AppData? appData) {
    final _$actionInfo = _$_MainStoreActionController.startAction(
      name: '_MainStore._onAppDataChange',
    );
    try {
      return super._onAppDataChange(appData);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages},
isReady: ${isReady},
isLoading: ${isLoading}
    ''';
  }
}
