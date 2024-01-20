import 'package:atma_paylas_app/api/hook_viewmodel_widget.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/enums/report_type.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/viewmodel/report.viewmodel.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/widgets/report_reason_item_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:validatorless/validatorless.dart';

@RoutePage()
class ReportView extends HookViewModelWidget<ReportViewModel> {
  const ReportView({
    required this.userId,
    super.key,
  });
  final int? userId;

  @override
  ReportViewModel createViewModel(BuildContext context) {
    return GetIt.instance<ReportViewModel>();
  }

  @override
  Widget buildWidget(BuildContext context, ReportViewModel viewModel) {
    viewModel
      ..blockUser = false
      ..setOrToggleSelectedReportType(null);
    final descriptionController = useTextEditingController();
    final reportViewformKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcıyı Bildir'),
        actions: [
          TextButton(
            onPressed: () => context.popRoute(),
            child: const Text('Vazgeç'),
          ),
        ],
      ),
      body: Form(
        key: reportViewformKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bildirme Sebebiniz',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Gap(9),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReportReasonItemWidget(
                        viewModel: viewModel,
                        reportType: ReportType.scam,
                        text: 'Dolandırıcılık veya şüpheli davranış',
                      ),
                      ReportReasonItemWidget(
                        viewModel: viewModel,
                        reportType: ReportType.inappropriate,
                        text: 'Uygunsuz profil/kullanıcı',
                      ),
                      ReportReasonItemWidget(
                        viewModel: viewModel,
                        reportType: ReportType.advertising,
                        text: 'Başka platform reklamı',
                      ),
                      ReportReasonItemWidget(
                        viewModel: viewModel,
                        reportType: ReportType.harassment,
                        text: 'Rahatsız edici davranış ve taciz',
                      ),
                      ReportReasonItemWidget(
                        viewModel: viewModel,
                        reportType: ReportType.other,
                        text: 'Diğer',
                      ),
                    ],
                  ),
                ),
                const Gap(18),
                const Text(
                  'Açıklama notu ekleyiniz',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const Gap(9),
                TextFormField(
                  maxLines: 5,
                  validator: Validatorless.multiple([
                    Validatorless.required('Açıklama notu boş bırakılamaz'),
                    Validatorless.max(
                      500,
                      'Açıklama notu en fazla 500 karakter olabilir',
                    ),
                  ]),
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    filled: false,
                    hintText: 'Açıklama notu',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(9),
                InkWell(
                  onTap: () {
                    viewModel.toggleBlockUser();
                  },
                  child: Row(
                    children: [
                      ListenableBuilder(
                        listenable: viewModel,
                        builder: (context, widget) {
                          return Checkbox.adaptive(
                            value: viewModel.blockUser,
                            onChanged: (value) {
                              viewModel.toggleBlockUser();
                            },
                          );
                        },
                      ),
                      const Text('Kullanıcıyı Engellemek İstiyorum'),
                    ],
                  ),
                ),
                const Gap(9),
                CustomFilledButtonBerke(
                  text: 'Kullanıcıyı Bildir',
                  onTap: () async {
                    if (reportViewformKey.currentState!.validate()) {
                      await viewModel.reportUser(
                        context,
                        descriptionController: descriptionController,
                        userID: userId!,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
