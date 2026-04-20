
class UserEntity {
  String? name;
  String? email;


  UserEntity({
    this.name, this.email,
  });

  UserEntity copyWith({
    String? name, String? email, String? role
  }) =>
      UserEntity(name: name ?? this.name,
        email: email ?? this.email,
      );




}