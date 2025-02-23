

// Sample (Placeholder)

class User {
	final int id;
	final String username;
	final String email;
	final String? profilePicture;

	User({
		required this.id,
		required this.username,
		required this.email,
		this.profilePicture,
	});

	// Factory constructor for creating User from JSON
	factory User.fromJson(Map<String, dynamic> json) {
		return User(
		id: json['id'] as int,
		username: json['username'] as String,
		email: json['email'] as String,
		profilePicture: json['profile_picture'] as String?,
		);
	}

	// Convert User to JSON
	Map<String, dynamic> toJson() {
		return {
		'id': id,
		'username': username,
		'email': email,
		'profile_picture': profilePicture,
		};
	}
}