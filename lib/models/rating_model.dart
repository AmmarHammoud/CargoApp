class RatingModel{
  late int id;
  late double rating;
  String? message;

  RatingModel.fromJson(Map<String, dynamic> json){
    id = json['id'];

  }
}