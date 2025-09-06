class NotificationModel {
  late String notification;
  late String time;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notification = json[''];
    time = json [''];
  }
}
