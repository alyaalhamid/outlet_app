import 'package:flutter/material.dart';
import 'package:outlet_app/Market.dart';
import 'package:outlet_app/ModelOutlet.dart';
import 'package:outlet_app/Outletdetail.dart';
import 'package:outlet_app/ServiceOutlet.dart';

class OutletView extends StatefulWidget {
  @override
  State<OutletView> createState() => _OutletViewState();
}

class _OutletViewState extends State<OutletView> {
  var viewoutlet;

  @override
  void initState() {
    super.initState();
    viewoutlet = ApiOutlet().getOutlet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EB),
      body: Padding(
        padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(color: Color(0xFFB18B7D)),
                  child: Center(
                    child: Text(
                      'OUTLET',
                      style: TextStyle(
                          color: Color(0xFF493801),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(20)),
                      color: Color(0xFFB18B7D)),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => market()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'ADD MARKET',
                            style: TextStyle(
                                color: Color(0xFF493801),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.store_rounded,
                            color: Color(0xFF493801),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<OutletResponse?>(
                future: viewoutlet,
                builder: (BuildContext context,
                    AsyncSnapshot<OutletResponse?> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi Kesalahan :${snapshot.error}'),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null &&
                        snapshot.data!.data!.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.data?.length,
                            itemBuilder: (context, index) {
                              modelOutlet outletmodel =
                                  snapshot.data!.data![index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => outletdetail(
                                          outletname: outletmodel.outlet_name
                                              .toString(),
                                          outletaddress: outletmodel
                                              .outlet_address
                                              .toString(),
                                          outletphoto:
                                              outletmodel.photo.toString(),
                                          areaname:
                                              outletmodel.area_name.toString(),
                                          latitude:
                                              outletmodel.latitude.toString(),
                                          longtitude:
                                              outletmodel.longtitude.toString(),
                                        ),
                                      ));
                                },
                                child: Card(
                                  color: Color(0xFFE9E9EB),
                                  margin: EdgeInsets.all(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB18B7D),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(30))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            outletmodel.photo as String,
                                            width: 150,
                                            height: 140,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  outletmodel.outlet_name
                                                      as String,
                                                  style: TextStyle(
                                                    color: outletmodel
                                                                .active_flag ==
                                                            true
                                                        ? Colors.green
                                                        : Colors.red,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  outletmodel.outlet_address
                                                      as String,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                )
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text('No data');
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
