import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/enums/report_type.dart';

class ReportRepository extends ApiService {
  Future<ApiResponse<String>> reportUser({
    required String userId,
    required String reportMessage,
    required ReportType reportType,
    required bool isUserBlock,
  }) async {
    return requestMethod<String>(
      path: '/report_user/$userId/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseConverter: (json) {
        return (json.data as Map<String, dynamic>)['success'] as String;
      },
      requestModel: {
        'report_type': reportType.name,
        'description': reportMessage,
        'block_user': isUserBlock ? 'True' : 'False',
      },
      method: HttpMethod.post,
    );
  }
}
