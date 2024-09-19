import 'package:flutter/material.dart';
import 'package:outlet_app/ModelOutlet.dart';
import 'package:outlet_app/ServiceOutlet.dart';
import 'package:outlet_app/ServiceOutletDetail.dart';
import 'package:outlet_app/modeldetailoutlet.dart';

class outletdetail extends StatefulWidget {
  outletdetail({super.key, required this.id});
  int id;
  @override
  State<outletdetail> createState() => _outletdetailState();
}

class _outletdetailState extends State<outletdetail> {
  var detailoutlet;
  @override
  void initState() {
    super.initState();
    detailoutlet = ApiOutletDetail().getOutletDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          'DETAIL OUTLET',
          style: TextStyle(color: Color(0xFF493801)),
        )),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF493801),
          ),
        ),
      ),
      backgroundColor: Color(0xFFE9E9EB),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 500,
          width: 500,
          child: Column(
            children: [
              Image.asset('assets/sudirman.jpeg'),
              SizedBox(
                height: 20,
              ),
              Text(
                'SUDIRMAN STORE AND RETAIL',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text('Jendral Sudirman Street House Company Block A10'),
              SizedBox(
                height: 10,
              ),
              Text('JAKARTA SELATAN'),
              SizedBox(
                height: 10,
              ),
              Text('-6.206128'),

              Text('106.573005')
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
      ),
    );
  }
}
