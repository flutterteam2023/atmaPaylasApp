import 'package:atma_paylas_app/features/ReportAndBlock/enums/report_type.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/viewmodel/report.viewmodel.dart';
import 'package:flutter/material.dart';

class ReportReasonItemWidget extends StatelessWidget {
  const ReportReasonItemWidget({
    required this.viewModel,
    required this.reportType,
    required this.text,
    super.key,
  });
  final ReportViewModel viewModel;
  final ReportType reportType;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        viewModel.setOrToggleSelectedReportType(reportType);
      },
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, widget) {
          final isSelected = viewModel.selectedReportType == reportType;
          final primaryColor = Theme.of(context).colorScheme.primary;
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  isSelected ? Icons.radio_button_on : Icons.radio_button_off,
                  color: isSelected ? primaryColor : Colors.grey,
                ),
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}
