


import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBottomSheet {

  static void toShow(BuildContext context ,Widget content){
    showModalBottomSheet(
        isScrollControlled:  true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return commonSheet(context,content);
        });

}

 static Widget commonSheet(BuildContext context ,Widget content){
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10,tileMode: TileMode.mirror),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade700,
                child: const Icon(Icons.close,size: 26,color: Colors.white,)),
          ) ,
          const SizedBox(height: 20,),
          Container(
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(15) )

            ),
            child: content,
          )
        ],
      ),
    );

  }
}


