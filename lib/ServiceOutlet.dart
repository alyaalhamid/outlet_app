import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:outlet_app/ModelOutlet.dart';

class ApiOutlet {
  Future<OutletResponse?> getOutlet() async {
    try {
      final response = await http.get(Uri.parse(
          'https://dl.dropboxusercontent.com/scl/fi/bx25gp7eyiop3u97plc14/outlet_soal.json?rlkey=apy6fqt0iya8ur0z7pkxg43ra&st=yus77u7v&dl=0'));
      if (response.statusCode == 200) {
        // var getoutletlist = jsonDecode(response.body) as List;
        // var listoutlet =
        //     getoutletlist.map((i) => modelOutlet.fromJson(i)).toList();
        // return listoutlet;
        var jsonData = jsonDecode(response.body);
        return OutletResponse.fromJson(jsonData);
        // var getoutletlist = jsonData['result'] as List;
        // var listoutlet =
        //     getoutletlist.map((i) => modelOutlet.fromJson(i)).toList();
        // return listoutlet;
      } else {
        throw Exception('Failed to Load Data');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
