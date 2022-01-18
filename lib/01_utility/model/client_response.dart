/**
 * Object returned by methods of MyClient
 */
class ClientResponse {
  ClientResponse({
    required this.status,
    this.data,
    this.errorCode,
    this.message,
  });

  bool status;
  dynamic data;
  int? errorCode;
  String? message;
}
