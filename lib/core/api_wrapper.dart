class ApiWrapper<T> {
  T? data;
  bool error;
  int? totalResults;

  ApiWrapper({
    this.data,
    required this.error,
    this.totalResults,
  });
}
