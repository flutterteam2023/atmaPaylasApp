// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/api_service.dart';
import 'package:atma_paylas_app/features/WaitingToConfirm/model/publish_to_confirm_listings_model.dart';

///Repository usage example:
///GetIt.instance<FeedbackRepository>().sendFeedBack('message') is returned as Future<ApiResponse<String>>
class PublishRepository extends ApiService {
  Future<ApiResponse<List<PublishToConfirmListingsModel>>> fetchAdminApprovalPending() async {
    return requestMethod<List<PublishToConfirmListingsModel>>(
      path: '/user_listings/admin_approval_pending',
      method: HttpMethod.get,
      requestModel:null,
      responseConverter:(response) => (response.data as List<dynamic>)
          .map(
            (e) => PublishToConfirmListingsModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }
}
