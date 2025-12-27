import 'pagination.dart';

class Meta {
	Pagination? pagination;

	Meta({this.pagination});

	@override
	String toString() => 'Meta(pagination: $pagination)';

	factory Meta.fromJson(Map<String, dynamic> json) => Meta(
				pagination: json['pagination'] == null
						? null
						: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'pagination': pagination?.toJson(),
			};

	Meta copyWith({
		Pagination? pagination,
	}) {
		return Meta(
			pagination: pagination ?? this.pagination,
		);
	}
}
