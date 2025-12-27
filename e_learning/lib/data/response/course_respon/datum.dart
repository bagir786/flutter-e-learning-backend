class Datum {
	int? id;
	String? documentId;
	DateTime? createdAt;
	DateTime? updatedAt;
	DateTime? publishedAt;
	String? name;
	String? description;
	String? releaseDate;
	bool? onSale;

	Datum({
		this.id, 
		this.documentId, 
		this.createdAt, 
		this.updatedAt, 
		this.publishedAt, 
		this.name, 
		this.description, 
		this.releaseDate, 
		this.onSale, 
	});

	@override
	String toString() {
		return 'Datum(id: $id, documentId: $documentId, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt, name: $name, description: $description, releaseDate: $releaseDate, onSale: $onSale)';
	}

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				documentId: json['documentId'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				publishedAt: json['publishedAt'] == null
						? null
						: DateTime.parse(json['publishedAt'] as String),
				name: json['name'] as String?,
				description: json['description'] as String?,
				releaseDate: json['release_date'] as String?,
				onSale: json['onSale'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'documentId': documentId,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'publishedAt': publishedAt?.toIso8601String(),
				'name': name,
				'description': description,
				'release_date': releaseDate,
				'onSale': onSale,
			};

	Datum copyWith({
		int? id,
		String? documentId,
		DateTime? createdAt,
		DateTime? updatedAt,
		DateTime? publishedAt,
		String? name,
		String? description,
		String? releaseDate,
		bool? onSale,
	}) {
		return Datum(
			id: id ?? this.id,
			documentId: documentId ?? this.documentId,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			publishedAt: publishedAt ?? this.publishedAt,
			name: name ?? this.name,
			description: description ?? this.description,
			releaseDate: releaseDate ?? this.releaseDate,
			onSale: onSale ?? this.onSale,
		);
	}
}
