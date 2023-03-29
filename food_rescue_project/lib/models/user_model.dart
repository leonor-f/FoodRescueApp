
class User {
  final String user_name;

  const User({
    required this.user_name
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    user_name: json['user_name']
  );

  Map<String, dynamic> toJson() => {
    'user_name': user_name
  };
}
