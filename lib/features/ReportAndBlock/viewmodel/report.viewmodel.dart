import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/enums/report_type.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/service/report.service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ReportViewModel extends ReportService with ChangeNotifier {
  ReportType? _selectedReportType;
  bool _blockUser = false;
  ReportType? get selectedReportType => _selectedReportType;
  void setOrToggleSelectedReportType(ReportType? reportType) {
    if (selectedReportType != reportType) {
      _selectedReportType = reportType;
    } else {
      _selectedReportType = null;
    }
    notifyListeners();
  }

  bool get blockUser => _blockUser;
  set blockUser(bool value) {
    _blockUser = value;
    notifyListeners();
  }

  void toggleBlockUser() {
    _blockUser = !_blockUser;
    notifyListeners();
  }

  Future<void> reportUser(
    BuildContext context, {
    required TextEditingController descriptionController,
    required int userID,
  }) async {
    try {
      final response = await reportUserEndpoint(
        description: descriptionController.text,
        blockUser: blockUser,
        reportType: selectedReportType!,
        userID: userID,
      );
      await response.fold(
        (l) async {
          Log.error(l, path: 'report.viewmodel.l');
          await EasyLoading.showToast('Hata Oluştu, $l');
        },
        (r) async {
          descriptionController.clear();
          setOrToggleSelectedReportType(null);
          // ignore: lines_longer_than_80_chars
          await EasyLoading.showToast(
            'Bildirdiğiniz için teşekkürler.\nBaşarıyla raporlandı',
            duration: const Duration(milliseconds: 1500),
          );

          Future.delayed(const Duration(milliseconds: 1500), () {
            context.popRoute();
          });
        },
      );
    } catch (e) {
      Log.error('Hata oluştu $e', path: 'report.viewmodel');
      await EasyLoading.showToast('Hata Oluştu, $e');
    }
  }
}
