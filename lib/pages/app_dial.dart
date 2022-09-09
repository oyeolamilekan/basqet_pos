import 'package:flutter/material.dart';
import 'package:flutter_basqet/flutter_basqet.dart';
import 'package:stacked/stacked.dart';

import '../config/app_config.dart';
import '../controllers/transaction_dial_controller.dart';
import '../widgets/button.dart';
import '../widgets/keyboard.dart';
import '../widgets/ternary_container.dart';
import '../extension/num.dart';

class TransactionDial extends StatelessWidget {
  const TransactionDial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionDialController>.reactive(
      viewModelBuilder: () => TransactionDialController(),
      onModelReady: (model) => model.fetchPrinters(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                AppConfigService.pushNamed("transaction_page");
              },
              icon: const Icon(Icons.pages),
            ),
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(10),
                      child: Ternary(
                        condition: viewModel.devices.isEmpty,
                        trueWidget: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 50,
                          ),
                          child: SizedBox(
                            child: Text(
                              "No device available.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        falseWidget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: viewModel.devices
                              .map(
                                (e) => Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        viewModel.connectToPrinter(e);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(e.name ?? ""),
                                    ),
                                    Ternary(
                                      condition:
                                          viewModel.selectedDevice?.name ==
                                              e.name,
                                      trueWidget: const Icon(
                                        Icons.check,
                                        color: Colors.black,
                                      ),
                                      falseWidget: const SizedBox(),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.print,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10.w,
                      height: 10.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "\$",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Ternary(
                      condition: viewModel.number.isEmpty,
                      trueWidget: Text(
                        "0",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                      falseWidget: Text(
                        viewModel.number,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                KeyBoard(
                  onCallback: (String value) => viewModel.callBack(value),
                  deleteLastNumber: () => viewModel.deleteLastDigit(),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Button(
                  color: Colors.black,
                  onPressed: () {
                    BasqetFlutter.launchBasqet(
                      context,
                      publicKey: "pub_test_Y4oKBXgfTU1JbJiHeGFc66rc1FFivg-",
                      amount: viewModel.cleanNumber,
                      currency: "USD",
                      description: "Love and light",
                      email: "oye@gmail.com",
                      onSuccess: (data) {},
                      onError: (error) {},
                      onClose: () {},
                    );
                  },
                  child: const Text(
                    "Proceed",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
