import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:zomato/src/config/router/route_constant.dart';
import 'package:zomato/src/core/utility/app_string.dart';

class MobileOTPVerfication extends StatefulWidget {
  const MobileOTPVerfication({super.key});

  @override
  State<MobileOTPVerfication> createState() => _MobileOTPVerficationState();
}

class _MobileOTPVerficationState extends State<MobileOTPVerfication> {
  OtpFieldController otpController = OtpFieldController();
  ValueNotifier<bool> error = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.otpveri),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: error,
            builder: (context, value, child) {
              return (error.value)
                  ? TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text(
                        AppString.skip,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ))
                  : Container();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: AppString.sendcode,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  const TextSpan(
                      text: '+91-8400570065',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 10,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    debugPrint("Changed: $pin");
                  },
                  onCompleted: (pin) {
                    debugPrint("Completed: $pin");
                    if (pin != "123456") {
                      error.value = true;
                    } else {
                      error.value = false;
                    }
                  }),
            ),
            ValueListenableBuilder(
                valueListenable: error,
                builder: (context, value, child) {
                  return (error.value == true)
                      ? Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(AppString.otperr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 141, 68, 68),
                                fontWeight: FontWeight.w500)),
                      )
                      : Container();
                }),
            const SizedBox(height: 30),
            ValueListenableBuilder(
              valueListenable: error,
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: value
                      ? () {
                          debugPrint("Hello");
                        }
                      : null,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: AppString.didnotget,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: AppString.resendsms,
                          style: value
                              ? const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                )
                              : const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(
                child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.go(RouteConstants.signup);
                    },
                    child: Text(
                      AppString.goback,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 215, 96, 96),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
