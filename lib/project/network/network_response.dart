class NetworkResponse<T> implements Exception {
  NetworkResponse.success(this.data) : code = NetworkResponseCode.success;

  NetworkResponse.error(this.error) : code = NetworkResponseCode.error;

  NetworkResponseCode code;

  T? data;

  dynamic error;
}

enum NetworkResponseCode { success, error }
