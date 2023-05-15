import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyFloatingActionButton extends GetView {



  final void Function()? onPressed;

  MyFloatingActionButton( {required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(

          width: 53,
          height: 53,
      child: FloatingActionButton(
        onPressed:onPressed,child:SvgPicture.asset('assets/floatingbutton.svg') ,
        backgroundColor: Colors.transparent,
        elevation: 0,







      ),
    );
  }
}
