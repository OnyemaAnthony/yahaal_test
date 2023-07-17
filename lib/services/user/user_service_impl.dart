//
//
// class UserServiceImpl extends BaseApi implements UserService{
//
//   UserServiceImpl(): super();
//
//   @override
//   Future<UserResponse> login(UserRequest request) async{
//     final response = await post('accounts:signInWithPassword',body: request.toJson());
//     return UserResponse.fromJson(response);
//   }
// }