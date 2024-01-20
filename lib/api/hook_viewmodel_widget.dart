import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class HookViewModelWidget<T> extends HookWidget {
  const HookViewModelWidget({super.key});

  T createViewModel(BuildContext context);
  Widget buildWidget(BuildContext context, T viewModel);

  @override
  Widget build(BuildContext context) {
    final viewModel = createViewModel(context);
    return buildWidget(context, viewModel);
  }
}
