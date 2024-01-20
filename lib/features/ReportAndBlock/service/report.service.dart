// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/enums/report_type.dart';

abstract class ReportService extends ApiService {
  Future<ApiResponse<String>> reportUserEndpoint({
    required String description,
    required bool blockUser,
    required ReportType reportType,
    required int userID,
  }) {
    return requestMethod(
      path: '/report_user/$userID/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseConverter: (p0) => (p0.data as Map<String, dynamic>)['success'] as String,
      requestModel: {
        'report_type': reportType.name,
        'description': description,
        'block_user': blockUser ? 'True' : 'False',
      },
      method: HttpMethod.post,
    );
  }
}
