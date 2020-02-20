


class Category
{
  final String cat_id;
  final String cat_name;
  final String cat_image;

  Category({this.cat_id, this.cat_name, this.cat_image});


  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(
      cat_id: json['cat_id']as String,
      cat_name: json['cat_name'].toString(),
      cat_image: json['cat_image'].toString(),

    );


      }

  }


