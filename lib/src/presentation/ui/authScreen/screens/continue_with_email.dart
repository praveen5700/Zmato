import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zomato/src/core/utility/styles.dart';
import 'package:zomato/src/core/utility/utilis.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_bloc.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_event.dart';
import 'package:zomato/src/presentation/bloc/authbloc/auth_state.dart';
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
      body: BlocConsumer<AuthBloc,AuthState>(
        listener: (context, state) {
           if(state is AuthErrorState){
            final snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration:const Duration(seconds: 3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 2,
            content: const Text('Invalid Mail',style: TextStyle(color: Colors.red,fontSize: 16)),
            action: SnackBarAction(
               textColor: Colors.red,
              label: 'Undo',
              onPressed: () {
              
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
           }

           if(state is AuthSuccessState){
            final snackBar = SnackBar(
                backgroundColor: Colors.white,
              duration:const Duration(seconds: 3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 1,
             content: const Text('OTP sent on your mail id',style: TextStyle(color: Colors.green,fontSize: 16)),
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.green,
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
           }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                            borderSide:
                                BorderSide(color: Colors.grey.shade600))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundedButton(
                    width: double.infinity,
                    buttontxt: (state is AuthLoadingState)?const CircularProgressIndicator(color: Colors.white,):Text("Send OTP", style:  AppStyle.mediumTextStyle(size: 18,color: Colors.white)),
                    color: enterText.text.toString().trim().isEmpty
                        ? Colors.grey.shade500
                        : const Color(0xFFE23744),
                    onpressed: enterText.text.toString().trim().isEmpty
                        ? null
                        : () {
                       
                            context.read<AuthBloc>().add(SendOTPonMailEvent(
                                enterText.text.trim().toString()));
                          },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    enterText.dispose();
    super.dispose();
  }
}
