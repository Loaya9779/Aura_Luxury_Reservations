class UserModel {
  final String email;
  final String name;
  final String id;
  final String phone;
  final List<dynamic> bookings;

  UserModel({
    required this.email,
    required this.name,
    required this.id,
    required this.phone,
    required this.bookings,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'name': name,
    'id': id,
    'phone': phone,
    'bookings': bookings,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    email: json['email']??'',
    name: json['name']??'',
    id: json['id']??'',
    phone: json['phone']??'',
    bookings: json['bookings']??'',
  );
}
