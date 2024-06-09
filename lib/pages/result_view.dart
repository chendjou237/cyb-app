// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:test1/controllers/scan/cubit/scan_cubit.dart';
import 'package:test1/models/models.dart';
import 'package:test1/utils/toast.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: BlocListener<ScanCubit, ScanState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ScanError ) {
              errorToast('error detected');
            }
            if (state is ScanRecordComplete) {
              context.read<ScanCubit>().getScanHistory();
              successToast('scan recorded successfully');
              context.go('/');
            }
          },
          child: BlocBuilder<ScanCubit, ScanState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 128,
                      width: 128,
                      child: Lottie.asset(
                          'assets/animations/error_animation.json',
                          height: 128,
                          width: 128,
                          fit: BoxFit.fill)),
                  const SizedBox(height: 16),
                  Text(
                    '${state.bugs} error detected',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Colors.redAccent),
                  ),
                  const SizedBox(height: 32),
                  if (state is ScanRecordInProgress)
                    const CircularProgressIndicator()
                  
                else  if(state.bugs > 0 ) Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ResultButton(
                          onTap: () {
                            _handleActionButton(state, context, 'Cleared');
                          },
                          color: Colors.green,
                          title: 'Clear Treat'),
                      const SizedBox(width: 16),
                      ResultButton(
                          onTap: () {
                            _handleActionButton(state, context, 'Quarantine');
                          },
                          color: Colors.amber,
                          title: 'Quarantine'),
                    ],
                  )else ResultButton(
                          onTap: () {
                            _handleActionButton(state, context, 'None');
                          },
                          color: Colors.green,
                          title: 'Go back Home'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleActionButton(ScanState state, BuildContext context, String action) {
    ScanModel scan = ScanModel(
        errors: state.bugs,
        date: DateTime.now().millisecondsSinceEpoch,
        action: action,
        );
    context.read<ScanCubit>().recordScan(scan);
  }
}

class ResultButton extends StatelessWidget {
  final Color color;
  final String title;
  final void Function() onTap;
  const ResultButton({
    super.key,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(title, style: TextStyle(color: Colors.white))),
    );
  }
}
