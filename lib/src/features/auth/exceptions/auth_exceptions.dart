class LoginExceptions implements Exception {
  LoginExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'LoginExceptions';
  }
}

class SingUpExceptions implements Exception {
  SingUpExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'SingUpExceptions';
  }
}

class ServerExceptions implements Exception {
  ServerExceptions({this.message});

  final String? message;

  @override
  String toString() {
    return message ?? 'ServerExceptions';
  }
}

class RefreshTokenExceptions implements Exception {
  RefreshTokenExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'RefreshTokenExceptions';
  }
}

class GenealAuthExceptions implements Exception {
  GenealAuthExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'SomethingWentWrongExceptions';
  }
}

class UnAuthorizedExceptions implements Exception {
  UnAuthorizedExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'UnAuthorizedExceptions';
  }
}

class UnknownExceptions implements Exception {
  UnknownExceptions({this.message});
  final String? message;

  @override
  String toString() {
    return message ?? 'UnknownExceptions';
  }
}
