// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';

///Repository usage example:
///GetIt.instance<FeedbackRepository>().sendFeedBack('message') is returned as Future<ApiResponse<String>>
class FeedbackRepository extends ApiService {
  Future<ApiResponse<String>> sendFeedBack(String message) async {
    return requestMethod<String>(
      path: '/feedback/',
      method: HttpMethod.post,
      requestModel: {
        'message': message,
      },
      responseConverter: (response) => (response.data as Map<String, dynamic>)['success'] as String,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
