class API {
  
  static const host = "http://192.168.18.10/mobapp";
  static const hostConnectionAdmin = "http://192.168.18.10/mobapp/user";
  static const hostConnectionProduct = "http://192.168.18.10/mobapp/products";
  // ADMIN LOGIN
  // Signup
  static const signUp = "$host/user/signup.php";
  static const validateEmail = "$host/user/validate_email.php";

  // Login
  static const adminLogin = "$host/user/validate_signup.php";
  // Forgot pass
  static const forgotPassword = "$host/user/forgot_pass.php";

  // Products CRUD
  static const createProduct = "$host/products/create_product.php";
  static const readProduct = "$host/products/read_product.php";
  static const updateProduct = "$host/products/update_product.php";


}