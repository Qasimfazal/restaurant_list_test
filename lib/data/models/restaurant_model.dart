class RestaurantModel {
  final int id;
  final String name;
  final String cuisine;

  RestaurantModel( { required this.id, required this.name , required this.cuisine });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      cuisine: json['cuisine']
      );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'cuisine': cuisine,
      };
  }
}
//Example Data from Json
// [
//     {
//         "id": 1,
//         "name": "The Smokehouse",
//         "cuisine": "Barbecue"
//     },
//     {
//         "id": 2,
//         "name": "Pinocchio's Pizza",
//         "cuisine": "Italian"
//     },
//     {
//         "id": 3,
//         "name": "Felipe's Taqueria",
//         "cuisine": "Mexican"
//     },
//     {
//         "id": 4,
//         "name": "Tasty Burger",
//         "cuisine": "American"
//     }
// ]