import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zomato/src/core/utility/styles.dart';
import 'package:zomato/src/core/utility/utilis.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/rounded_elevated_button.dart';

class ContinueWithEmail extends StatefulWidget {
  const ContinueWithEmail({super.key});

  @override
  State<ContinueWithEmail> createState() => _ContinueWithEmailState();
}

class _ContinueWithEmailState extends State<ContinueWithEmail> {
  TextEditingController enterText = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Continue with Email",
          style: AppStyle.mediumTextStyle(size: 20),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Utilis.hideKeyboard(context);
              context.pop();
            },
            child: const Icon(
              Icons.expand_more_sharp,
              size: 34,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
          child: Column(
            children: [
              TextFormField(
                onChanged: (val) {
                  if (val.trim().toString().length == 1 ||
                      val.trim().toString().length == 0) {
                    setState(() {});
                  }
                },
                //  autofocus: true,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: enterText,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    suffix: enterText.text.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              enterText.clear();
                              setState(() {});
                            },
                            child: CircleAvatar(
                                backgroundColor: Colors.grey.shade400,
                                radius: 10,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 14,
                                )))
                        : Container(),
                    contentPadding: EdgeInsets.zero,
                    labelText: "Email or Username",
                    labelStyle: AppStyle.normalTextStyle(
                        color: Colors.grey.shade500, size: 16),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                width: double.infinity,
                buttontxt: "Send OTP",
                color: enterText.text.toString().trim().isEmpty
                    ? Colors.grey.shade500
                    : const Color(0xFFE23744),
                onpressed: enterText.text.toString().trim().isEmpty
                    ? null
                    : () {
                        debugPrint("Button Clicked");
                      },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    enterText.dispose();
    super.dispose();
  }
}
