class Pagination {
	int? page;
	int? pageSize;
	int? pageCount;
	int? total;

	Pagination({this.page, this.pageSize, this.pageCount, this.total});

	@override
	String toString() {
		return 'Pagination(page: $page, pageSize: $pageSize, pageCount: $pageCount, total: $total)';
	}

	factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
				page: json['page'] as int?,
				pageSize: json['pageSize'] as int?,
				pageCount: json['pageCount'] as int?,
				total: json['total'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'page': page,
				'pageSize': pageSize,
				'pageCount': pageCount,
				'total': total,
			};

	Pagination copyWith({
		int? page,
		int? pageSize,
		int? pageCount,
		int? total,
	}) {
		return Pagination(
			page: page ?? this.page,
			pageSize: pageSize ?? this.pageSize,
			pageCount: pageCount ?? this.pageCount,
			total: total ?? this.total,
		);
	}
}
