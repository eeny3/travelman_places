import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travelman/utils/colors.dart';
import 'package:travelman/utils/wide_button.dart';

// ignore: must_be_immutable
class TicketInfoScreen extends StatelessWidget {
  final flightDataDecoded;
  final String origin;
  final String destination;
  final String depDate;
  final String retDate;

  TicketInfoScreen(this.flightDataDecoded, this.origin, this.destination,
      this.depDate, this.retDate);

  List<Widget> airfares = [];

  void createAirfares() {
    for (var v in flightDataDecoded["data"][destination]?.values) {
      String airline = '${v['airline']}';
      Widget airfare = Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      v["departure_at"].substring(11, 16),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text(
                      origin,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  lineLength: 140,
                  dashGapLength: 15,
                  lineThickness: 4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      v["return_at"].substring(11, 16),
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5),
                    Text(
                      destination,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      child: Image.asset(
                          'assets/images/airline_logos/$airline.png' ?? ''),
                    ),
                    Text(
                      '$airline',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  child: Text(
                    '${v["price"].toString()}' + '  ' + 'currency'.tr(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            WideButton('book now'.tr(), () {}, kPinBlue),
          ],
        ),
      );
      airfares?.add(airfare);
    }
  }

  @override
  Widget build(BuildContext context) {
    createAirfares();
    return Scaffold(
      appBar: AppBar(
        title: Text('best deals'.tr()),
        centerTitle: true,
        backgroundColor: Color(0xffF8F9F9),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xffF8F9F9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'origin'.tr(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          origin,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '$depDate   -   $retDate',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'destination'.tr(),
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 5),
                        Text(
                          destination,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text('${airfares.length}' + ' search results'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
            SizedBox(
              height: 25,
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: airfares.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      airfares[index],
                      SizedBox(height: 45),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
