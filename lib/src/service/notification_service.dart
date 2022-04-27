
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_digital_prizm/src/model/todo_model.dart';

abstract class NotificationService {
  void init(Future<dynamic> Function(int, String?, String?, String?)? onDidReceive);
 //  Future selectNotification(String? payload);
  // void showNotification(TodoModel todoModel);
  // void cancelAllNotifications();
  // Future<List<PendingNotificationRequest>> getAllScheduledNotifications();
}