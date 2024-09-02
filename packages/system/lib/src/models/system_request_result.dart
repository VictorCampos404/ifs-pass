class SystemRequestResult {
  bool status;
  String? title;
  String? message;

  SystemRequestResult({
    required this.status,
    this.title,
    this.message,
  });
}
