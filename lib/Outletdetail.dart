import 'package:flutter/material.dart';
import 'package:outlet_app/ModelOutlet.dart';
import 'package:outlet_app/ServiceOutlet.dart';

class outletdetail extends StatefulWidget {
  outletdetail({
    super.key,
    required this.outletname,
    required this.outletphoto,
    required this.outletaddress,
    required this.areaname,
    required this.latitude,
    required this.longtitude,
  });
  String outletname;
  String outletphoto;
  String outletaddress;
  String areaname;
  String latitude;
  String longtitude;

  @override
  State<outletdetail> createState() => _outletdetailState();
}

class _outletdetailState extends State<outletdetail> {
  var detailoutlet;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EB),
      body: Padding(
        padding: const EdgeInsets.only(top: 55, left: 10, right: 10),
        child: Column(
          children: [
            Text('DETAIL OUTLET',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF493801),
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: 550,
              width: 550,
              child: Column(
                children: [
                  Image.network(widget.outletphoto),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      widget.outletname,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.outletaddress,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(widget.areaname,
                          style: TextStyle(fontSize: 18))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(widget.latitude.toString(),
                        style: TextStyle(fontSize: 18)),
                  ),

                  Center(
                    child: Text(widget.longtitude.toString(),
                        style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF493801)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('BACK TO HOME'))
                  // FutureBuilder<OutletDetailResponse?>(
                  //     future: detailoutlet,
                  //     builder: (BuildContext context,
                  //         AsyncSnapshot<OutletDetailResponse?> snapshot) {
                  //       if (snapshot.hasError) {
                  //         return Center(
                  //           child: Text('Terjadi Kesalahan :${snapshot.error}'),
                  //         );
                  //       } else if (snapshot.connectionState == ConnectionState.done) {
                  //         if (snapshot.data != null &&
                  //             snapshot.data!.data!.isNotEmpty) {
                  //           modelOutlet outletmodel = modelOutlet();
                  //           return Center(
                  //             child: Column(
                  //               children: [
                  //                 Image.network(outletmodel.photo.toString()),
                  //                 SizedBox(
                  //                   height: 10,
                  //                 ),
                  //                 Text(outletmodel.outlet_name.toString())
                  //               ],
                  //             ),
                  //           );
                  //         } else {
                  //           return Text('No data');
                  //         }
                  //       } else {
                  //         return Center(child: CircularProgressIndicator());
                  //       }
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
