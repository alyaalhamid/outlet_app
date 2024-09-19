import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:outlet_app/ModelOutlet.dart';
import 'package:outlet_app/modeldetailoutlet.dart';

class ApiOutletDetail {
  Future<OutletDetailResponse?> getOutletDetail(int id) async {
    try {
      final response = await http.get(Uri.parse(
          'https://dl.dropboxusercontent.com/scl/fi/bx25gp7eyiop3u97plc14/outlet_soal.json?rlkey=apy6fqt0iya8ur0z7pkxg43ra&st=yus77u7v&dl=0/$id'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return OutletDetailResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to Load Data');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
