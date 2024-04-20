class PaginateResponse<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PaginateResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
  });

 factory PaginateResponse.fromJson(Map<String, dynamic> json) => PaginateResponse<T>(
  page: json["page"],
  results: json["resuts"] as List<T>,
  totalPages: json["total_pages"],
  totalResults: json["total_results"],
 );
}
