import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zomato/src/core/utility/styles.dart';
import 'package:zomato/src/core/utility/utilis.dart';


class ContinueWithEmail extends StatefulWidget{
  @override
  State<ContinueWithEmail> createState() => _ContinueWithEmailState();
}

class _ContinueWithEmailState extends State<ContinueWithEmail> {
  TextEditingController enterText  =  TextEditingController();
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Continue with Email",style: AppStyle.mediumTextStyle(size: 20),),
        centerTitle: true,
        leading: InkWell(
            onTap: (){
            Utilis.hideKeyboard(context);
              Navigator.pop(context);
            },
            child: Icon(Icons.expand_more_sharp,size: 34,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8,vertical: 40),
          child: Column(
            children: [
              TextFormField(
              //  autofocus: true,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: enterText,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    labelText: "Email or Username",
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    enterText.dispose();
    super.dispose();
  }
}