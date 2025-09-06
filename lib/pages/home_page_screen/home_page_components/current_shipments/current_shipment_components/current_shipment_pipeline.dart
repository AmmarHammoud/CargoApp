import 'dart:async';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import '../../../../../models/shipment_model.dart';
import 'current_shipment_steps.dart';

class CurrentShipmentPipeline extends StatefulWidget {
  const CurrentShipmentPipeline({
    super.key,
    required this.shipmentModel,
  });

  final ShipmentModel shipmentModel;

  @override
  State<CurrentShipmentPipeline> createState() =>
      _CurrentShipmentPipelineState();
}

class _CurrentShipmentPipelineState extends State<CurrentShipmentPipeline> {
  int _currentPage = 0;
  Timer? _timer;
  final controller =
      PageController(viewportFraction: 0.8, keepPage: true, initialPage: 0);

  final double stepRadius = 10.0;

  @override
  void initState() {
    // steps[0] = steps[steps.length - 1] = EasyStep(
    //   customStep: Container(
    //     width: stepRadius * 1.5,
    //     height: stepRadius * 1.5,
    //     decoration: const BoxDecoration(
    //       color: Colors.green,
    //       shape: BoxShape.circle,
    //     ),
    //     child: Icon(
    //       Icons.add,
    //       color: Colors.white,
    //       size: 20.0,
    //     ),
    //   ),
    // );
    super.initState();
    // _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
    //   controller.animateToPage(
    //     _currentPage++ % pages.length,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeIn,
    //   );
    // });
    controller.addListener(() {
      setState(() {
        _currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      //height: MediaQuery.of(context).size.height * 0.05,
      //width: 350,

      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(
          //   height: 1,
          //   child: PageView.builder(
          //     onPageChanged: (index) {
          //       setState(() {
          //         _currentPage = index;
          //       });
          //     },
          //     controller: controller,
          //     itemBuilder: (_, index) => Container(),
          //   ),
          // ),
          EasyStepper(
            fitWidth: true,
            activeStep: widget.shipmentModel.status.activeStateIndex(),
            steps: currentShipmentSteps(stepRadius: stepRadius),
            stepShape: StepShape.circle,
            borderThickness: 2,
            stepRadius: stepRadius,
            finishedStepBorderColor: Colors.pink[900],
            unreachedStepBackgroundColor: Colors.grey,
            finishedStepBackgroundColor: Colors.pink[300]!,
            activeStepBackgroundColor: Colors.orange[200],
            showLoadingAnimation: false,
            internalPadding: 5.0,
            lineStyle: const LineStyle(lineLength: 10),
          ),
        ],
      )
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Text("الالبسة"),
          //     Text("data"),
          //     AnimatedSmoothIndicator(
          //       //controller: controller,
          //       count: pages.length,
          //       effect: const SlideEffect(),
          //       activeIndex: 0,
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
