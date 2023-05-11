import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/Module/Monthly%20Bills/Controller/monthly_bills_controller.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Widgets/Loader/loader.dart';

class MonthlyBills extends GetView {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MonthlyBillsController>(
        init: MonthlyBillsController(),
          builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [

                MyBackButton(text: 'Monthly Bill',),
                Expanded(
                  child: FutureBuilder(
                      future: controller.monthlyBillsApi(userid: controller.resident.residentid!, token: controller.userdata.bearerToken!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                  if (snapshot.data.data != null ) {

                  return SingleChildScrollView(
                    child: Column(
                    children: [

                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
                    height: 10,
                    ),
                    CircleAvatar(
                    backgroundImage: AssetImage(
                    'assets/user.png'),
                    ),
                    SizedBox(
                    height: 10,
                    ),
                    Text(
                    'Smart Gate - Monthly Bill',
                    style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                    ),
                    Text(
                    snapshot.data.data.duedate.toString(),
                    style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                    ),
                    SizedBox(
                    height: 30,
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                    SizedBox(
                    width: 8,
                    ),
                    Text(
                    'Amount Due',
                    style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
                    ),
                    Text(
                    'PKR ${snapshot.data.data.payableamount.toString()}',
                    style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
                    ),
                    SizedBox(
                    width: 8,
                    ),
                    ],
                    ),
                    SizedBox(
                    height: 20,
                    ),
                    MyBillWidget(name: 'Charges',
                    description: 'PKR ${snapshot.data.data.charges.toString()}'),
                    MyBillWidget(name: 'App Charges',
                    description: 'PKR ${snapshot.data.data.appcharges.toString()}'),
                    MyBillWidget(
                    name: 'Tax', description: 'PKR ${snapshot.data.data.tax.toString()}'),
                    SizedBox(
                    height: 20,
                    ),
                    MyBillDivider(),
                    SizedBox(
                    height: 20,
                    ),
                    MyBillWidget(name: 'Balance',
                    description: 'PKR ${snapshot.data.data.balance.toString()}'),
                    MyBillWidget(
                    name: 'Amount After Due Date',
                    description: 'PKR ${snapshot.data.data.chargesafterduedate.toString()}'),
                    SizedBox(
                    height: 20,
                    ),
                    MyBillDivider(),
                    MyBillWidget(
                    name: 'Billing Month',
                    description: snapshot.data.data.month.toString()),
                    MyBillWidget(
                    name: 'Due Date',
                    description: '${snapshot.data.data.duedate.toString()}'),
                    MyBillDivider(),
                    SizedBox(
                    height: 20,
                    ),
                    MyButton(
                    name: 'Pay',
                    color: Colors.green,
                    onPressed: () {},
                    ),
                    SizedBox(
                    height: 20,
                    ),
                    ],
                    ),
                    ),
                    )
                    ],
                    ),
                  );
                  }

                  else {

                  return EmptyList( name: 'You have no bill to paid.',);
                  }


                  }


                        else if (snapshot.hasError) {

                          return Icon(Icons.error);
    }


                        else {
                          return Loader();

                        }
                      }),
                ),
              ],
            ));
      }),
    );
  }
}

class MyBillDivider extends StatelessWidget {
  const MyBillDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Divider(
        thickness: 1,
      ),
    );
  }
}

class MyBillWidget extends StatelessWidget {
  final String name;
  final String description;

  const MyBillWidget({required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    name,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    description,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
