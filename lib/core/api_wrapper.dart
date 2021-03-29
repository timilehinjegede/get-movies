class ApiWrapper<T> {
  T? data;
  bool error;
  int? currentPage;
  int? totalPage;

  ApiWrapper({
    this.data,
    required this.error,
    this.currentPage,
    this.totalPage,
  });
}
