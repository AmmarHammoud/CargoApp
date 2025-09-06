class UserModel{
  late int id;
  late String userName;
  late String? email;
  late String phone;
  String? token;
  UserModel({required this.id, required this.userName, required this.email, required this.phone,});

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userName = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }
}