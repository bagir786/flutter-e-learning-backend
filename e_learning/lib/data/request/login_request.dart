import 'dart:convert';

class LoginRequest {
	String? identifier;
	String? password;

	LoginRequest({this.identifier, this.password});

	@override
	String toString() {
		return 'LoginRequest(identifier: $identifier, password: $password)';
	}

	factory LoginRequest.fromMap(Map<String, dynamic> data) => LoginRequest(
				identifier: data['identifier'] as String?,
				password: data['password'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'identifier': identifier,
				'password': password,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginRequest].
	factory LoginRequest.fromJson(String data) {
		return LoginRequest.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [LoginRequest] to a JSON string.
	String toJson() => json.encode(toMap());

	LoginRequest copyWith({
		String? identifier,
		String? password,
	}) {
		return LoginRequest(
			identifier: identifier ?? this.identifier,
			password: password ?? this.password,
		);
	}
}
