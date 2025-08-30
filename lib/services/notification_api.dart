import 'package:flutterstarter/models/notifications/notifications.dart';
import 'package:flutterstarter/utils/http.dart';
import 'package:get_it/get_it.dart';

class NotificationApi {
  Future<Notifications> list() async {
    final json = await GetIt.I<Http>().get('notifications');
    return Notifications.fromJson(json);
  }

  Future<void> read(String notificationKey) async {
    await GetIt.I<Http>().post(path: 'notifications/read/$notificationKey');
  }
}
