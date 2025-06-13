enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

abstract class BaseApiRequest {
  String get path;
  HTTPMethod get method;
  Map<String, String>? get headers => null;
  Map<String, String>? get query => null;
  dynamic get body => null;
  Future request();
}
