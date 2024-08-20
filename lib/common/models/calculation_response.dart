class ResponseErrorData {
  ResponseErrorData({
    required this.message,
  });

  factory ResponseErrorData.fromJson(Map<String, dynamic>? json) {
    return ResponseErrorData(
      message: json?['message'] as String?,
    );
  }
  final String? message;

  @override
  String toString() {
    return 'ResponseErrorData(message: $message)';
  }
}
