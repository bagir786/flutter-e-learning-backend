import 'dart:convert';

class User {
	int? id;
	String? documentId;
	String? username;
	String? email;
	String? provider;
	bool? confirmed;
	bool? blocked;
	DateTime? createdAt;
	DateTime? updatedAt;
	DateTime? publishedAt;

	User({
		this.id, 
		this.documentId, 
		this.username, 
		this.email, 
		this.provider, 
		this.confirmed, 
		this.blocked, 
		this.createdAt, 
		this.updatedAt, 
		this.publishedAt, 
	});

	@override
	String toString() {
		return 'User(id: $id, documentId: $documentId, username: $username, email: $email, provider: $provider, confirmed: $confirmed, blocked: $blocked, createdAt: $createdAt, updatedAt: $updatedAt, publishedAt: $publishedAt)';
	}

	factory User.fromMap(Map<String, dynamic> data) => User(
				id: data['id'] as int?,
				documentId: data['documentId'] as String?,
				username: data['username'] as String?,
				email: data['email'] as String?,
				provider: data['provider'] as String?,
				confirmed: data['confirmed'] as bool?,
				blocked: data['blocked'] as bool?,
				createdAt: data['createdAt'] == null
						? null
						: DateTime.parse(data['createdAt'] as String),
				updatedAt: data['updatedAt'] == null
						? null
						: DateTime.parse(data['updatedAt'] as String),
				publishedAt: data['publishedAt'] == null
						? null
						: DateTime.parse(data['publishedAt'] as String),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'documentId': documentId,
				'username': username,
				'email': email,
				'provider': provider,
				'confirmed': confirmed,
				'blocked': blocked,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'publishedAt': publishedAt?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

	User copyWith({
		int? id,
		String? documentId,
		String? username,
		String? email,
		String? provider,
		bool? confirmed,
		bool? blocked,
		DateTime? createdAt,
		DateTime? updatedAt,
		DateTime? publishedAt,
	}) {
		return User(
			id: id ?? this.id,
			documentId: documentId ?? this.documentId,
			username: username ?? this.username,
			email: email ?? this.email,
			provider: provider ?? this.provider,
			confirmed: confirmed ?? this.confirmed,
			blocked: blocked ?? this.blocked,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			publishedAt: publishedAt ?? this.publishedAt,
		);
	}
}
