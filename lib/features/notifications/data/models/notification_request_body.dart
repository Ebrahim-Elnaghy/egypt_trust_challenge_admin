class AddNotificationRequestBody {
  final String title;
  final String body;

  AddNotificationRequestBody({required this.title, required this.body});

  Map<String, dynamic> toJson() {
    return {
      "to": "/topics/All",
      "notification": {"title": title, "body": body}
    };
  }
}
