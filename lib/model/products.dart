class Products {


  int? product_id;
  String? product_name;
  String? product_category;
  String? product_brand;
  String? product_quantity;
  String? product_price;

  Products (
    this.product_id,
    this.product_name,
    this.product_category,
    this.product_brand,
    this.product_quantity,
    this.product_price,
  );

  Map<String, dynamic> toJson() => {
    'product_id': product_id.toString(),
    'product_name': product_name.toString(),
    'product_category': product_category.toString(),
    'product_brand': product_brand.toString(),
    'product_quantity': product_quantity.toString(),
    'product_price': product_price.toString(),
  };



}