import 'package:flutter/material.dart';
import 'package:outlet_app/ServiceMarket.dart';

class market extends StatefulWidget {
  const market({super.key});

  @override
  State<market> createState() => _marketState();
}

class _marketState extends State<market> {
  List<Map<String, dynamic>> _market = [];

  bool _isloading = true;

  bool _isEdit = true;

  void _refreshMarket() async {
    final data = await marketHelper.getAllItem();
    setState(() {
      _market = data;
      _isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshMarket();
    print('..number of item ${_market.length}');
  }

  TextEditingController _namestore = TextEditingController();
  TextEditingController _address = TextEditingController();

  Future<void> _addItem() async {
    await marketHelper.createItem(_namestore.text, _address.text);
    _refreshMarket();
    print('..number of item ${_market.length}');
  }

  void _form(int? id) async {
    if (id != null) {
      final extingmarket =
          _market.firstWhere((element) => element['market_code'] == id);
      _namestore.text = extingmarket['market_name'];
      _address.text = extingmarket['market_address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9EB),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Text(
                  'NEW MARKET',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Market',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        height: 40,
                        child: TextFormField(
                          controller: _namestore,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 10, bottom: 6),
                              hintText: 'Name Market',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        height: 100,
                        child: TextFormField(
                          controller: _address,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 10),
                              hintText: 'Address',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: Image.asset('assets/camera.png')),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: ElevatedButton(
                        onPressed: () async {
                          _form(null);
                          await _addItem();

                          _namestore.text = '';
                          _address.text = '';
                        },
                        child: Text('SAVE MARKET'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00C4D6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 400,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Market',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: _market.length,
                              itemBuilder: (context, index) => Card(
                                    margin: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/warung-madura.jpeg',
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.contain,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _market[index]['market_name'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                'MARKET_${_market[index]['created_date']}_000${_market[index]['market_code'].toString()}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                _market[index]
                                                    ['market_address'],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
