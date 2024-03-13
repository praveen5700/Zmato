import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zomato/src/core/utility/styles.dart';
import 'package:zomato/src/presentation/ui/authScreen/screens/continue_with_email.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/custom_mobile_textfield.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/flag_dropdown.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/rounded_elevated_button.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/signup_logo.dart';

import '../../../../core/utility/app_string.dart';
import '../../../components/commonBottomSheet.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController mobileNumber = TextEditingController();
  ValueNotifier<Country?> countrydetails = ValueNotifier(null);

  void initCountry() async {
    final list = await getCountries(context);
    debugPrint("Coutries length is ${list.length}");
    try {
      countrydetails.value =
          list.firstWhere((element) => element.callingCode.toString() == "+91");
    } catch (e) {
      countrydetails.value = list[0];
    }
  }

  @override
  void initState() {
    super.initState();
    initCountry();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              child: Image.asset(AppString.zomatoimage),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    AppString.no1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          endIndent: 15,
                        ),
                      ),
                      Text(
                        AppString.loginorsignup,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          indent: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder(
                    valueListenable: countrydetails,
                    builder: (context, value, child) {
                      return Column(
                        children: <Widget>[
                          countrydetails.value == null
                              ? Container()
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: _onPressedShowBottomSheet,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // Flag and dropdown
                                  child: FlagAndDropDown(
                                    flag: countrydetails.value?.flag ?? "",
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              //Textfield
                              Expanded(
                                child: CustomTextField(
                                  controller: mobileNumber,
                                  callingCode: countrydetails.value
                                      ?.callingCode
                                      .toString() ??
                                      "",
                                  validator: (value) {
                                    if (value != null &&
                                        value.length != 10) {
                                      return 'Mobile number must be 10 digits long.';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // continue button
                  RoundedButton(width: size.width),
                  const SizedBox(height: 20),
                  // Content below the continue button
                  Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              endIndent: 15,
                            ),
                          ),
                          Text(
                            'or',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              indent: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // signup method
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignUpLogo(
                            imagePath: AppString.googleicon,
                          ),
                          SignUpLogo(
                            imagePath: AppString.appleicon,
                          ),
                          InkWell(
                            onTap: () {
                              CustomBottomSheet.toShow(
                                context,
                                showContentInBottomSheet(),
                              );
                            },
                            child: SignUpLogo(
                              imagePath: AppString.moreverticon,
                            ),
                          )
                        ],
                      ),
                      SafeArea(
                        child: Column(
                          children: [
                            Text(
                              AppString.continuing,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppString.terms,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  AppString.privacy,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  AppString.content,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      countrydetails.value = country;
    }
  }

  Widget showContentInBottomSheet() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.5, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/facebook.png",
                width: 30,
              ),
              SizedBox(width: 8),
              Text(
                "Continue with Facebook",
                style: AppStyle.mediumTextStyle(size: 16),
              )
            ],
          ),
        ),
        SizedBox(height: 12),
        InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContinueWithEmail()),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.5, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/email.png",
                  width: 30,
                ),
                SizedBox(width: 8),
                Text(
                  "Continue with Email",
                  style: AppStyle.mediumTextStyle(size: 16),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
