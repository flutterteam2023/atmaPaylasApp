// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Authentication/models/user/user_model.dart';

///Repository usage example:
///GetIt.instance<UserRepository>().getMyUserProfile() is returned as Future<ApiResponse<UserModel>>
///GetIt.instance<UserRepository>().getOtherUserProfile(userId: 2) is returned as Future<ApiResponse<UserModel>>
class UserRepository extends ApiService {
  static UserModel? user;
  Future<ApiResponse<UserModel>> getMyUserProfile() async {
    return requestMethod<UserModel>(
      path: '/user_profile/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => UserModel.fromJson(response.data as Map<String, dynamic>),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<ApiResponse<UserModel>> getOtherUserProfile({required int userId}) async {
    return requestMethod<UserModel>(
      path: '/user_profile/$userId',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => UserModel.fromJson(response.data as Map<String, dynamic>),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
