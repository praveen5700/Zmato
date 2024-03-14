import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/custom_mobile_textfield.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/flag_dropdown.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/rounded_elevated_button.dart';
import 'package:zomato/src/presentation/ui/authScreen/widgets/signup_logo.dart';
import '../../../../core/utility/app_string.dart';

class SignupScreen extends StatefulWidget {
  final String userId;
  final String userName;
  const SignupScreen({super.key, required this.userId, required this.userName});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController mobileNumber = TextEditingController();
  ValueNotifier<Country?> countrydetails = ValueNotifier(null);

  @override
  void dispose() {
    super.dispose();
    mobileNumber.dispose();
    countrydetails.dispose();
  }

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
    debugPrint(widget.userId.toString());
    debugPrint(widget.userName);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        child: Image.asset(AppString.zomatoimage)),
                    Positioned(
                      right: 30,
                      top: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(128, 0, 0, 0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(177, 0, 0, 0),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 4.0),
                            child: Icon(
                              Icons.sign_language,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      AppString.no1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
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
                              color: Colors.black54),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                    color: Colors.grey)),
                                            // Flag and dropdown
                                            child: FlagAndDropDown(
                                                flag: countrydetails
                                                        .value?.flag ??
                                                    ""),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        //Textfield
                                        Expanded(
                                          child: CustomTextField(
                                            controller: mobileNumber,
                                            callingCode: countrydetails
                                                    .value?.callingCode
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
                        }),
                    const SizedBox(height: 20),
                    // continue button
                    RoundedButton(width: size.width),
                    const SizedBox(height: 20),
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
                              color: Colors.black54),
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
                        SignUpLogo(
                          imagePath: AppString.moreverticon,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppString.continuing,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade900)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppString.terms,
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade900)),
                        const SizedBox(width: 10),
                        Text(AppString.privacy,
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade900)),
                        const SizedBox(width: 10),
                        Text(AppString.content,
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey.shade900)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
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
}
