import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class EmptyList extends GetView {
final String?  name;

  EmptyList({this.name});

  @override
  Widget build(BuildContext context) {
    return
      Center(child: Text(name??"No Data",
          style: GoogleFonts.ubuntu(
        color:
        HexColor('#404345'),
    fontStyle:
    FontStyle.normal,
    letterSpacing: 0.0015,
    fontSize: 16,
    fontWeight:
    FontWeight.w500)));

}}
