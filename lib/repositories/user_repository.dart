import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/Authentication/models/user/user_model.dart';

class UserRepository extends ApiService {
  static UserModel? user;
  Future<ApiResponse<UserModel>> getMyUserProfile() async {
    return await requestMethod<UserModel>(
      path: '/user_profile/',
      method: HttpMethod.get,
      requestModel: null,
      responseConverter: (response) => UserModel.fromJson(response.data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}