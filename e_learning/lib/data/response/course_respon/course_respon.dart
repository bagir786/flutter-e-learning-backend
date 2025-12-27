
import 'datum.dart';
import 'meta.dart';

class CourseRespon {
	List<Datum>? data;
	Meta? meta;

	CourseRespon({this.data, this.meta});

	@override
	String toString() => 'CourseRespon(data: $data, meta: $meta)';

	factory CourseRespon.fromJson(Map<String, dynamic> json) => CourseRespon(
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
				meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
				'meta': meta?.toJson(),
			};

	CourseRespon copyWith({
		List<Datum>? data,
		Meta? meta,
	}) {
		return CourseRespon(
			data: data ?? this.data,
			meta: meta ?? this.meta,
		);
	}
}
