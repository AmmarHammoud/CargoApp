import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../show_toast.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendingReportCubit(),
      child: BlocConsumer<SendingReportCubit, SendingReportStates>(
        listener: (context, state) {
          if (state is SendingReportSuccessState) {
            Navigator.pop(context);
            showToast(
                context: context,
                text: state.message,
                color: Constants.successColor);
          }
        },
        builder: (context, state) {
          var cubit = SendingReportCubit.get(context);
          return ConditionalBuilder(
            condition: state is SendingReportLoadingState,
            builder: (context) => const Center(
              child: LinearProgressIndicator(),
            ),
            fallback: (context) => AlertDialog(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
                // maxWidth: MediaQuery.of(context).size.width * 0.9,
              ),
              title: Text('Report a problem'),
              content: Column(
                children: [
                  TextFormField(
                    maxLines: 3,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    controller: cubit.reportMessageController,
                  ),
                  TextButton(
                      onPressed: () {
                        cubit.sendReport(
                          id: id,
                          message: cubit.reportMessageController.text,
                        );
                      },
                      child: const Text('Send'))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
