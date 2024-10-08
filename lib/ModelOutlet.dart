class modelOutlet {
  int? outlet_id;
  String? outlet_name;
  String? outlet_address;
  int? area_id;
  String? area_name;
  String? photo;
  String? latitude;
  String? longtitude;
  String? created_at;
  int? created_by;
  bool? active_flag;

  modelOutlet(
      {this.outlet_id,
      this.outlet_name,
      this.outlet_address,
      this.area_id,
      this.area_name,
      this.photo,
      this.latitude,
      this.longtitude,
      this.created_at,
      this.created_by,
      this.active_flag});

  factory modelOutlet.fromJson(Map<String, dynamic> json) {
    return modelOutlet(
        outlet_id: json['outlet_id'],
        outlet_name: json['outlet_name'],
        outlet_address: json['outlet_address'],
        area_id: json['area_id'],
        area_name: json['area_name'],
        photo: json['photo'],
        latitude: json['latitude'],
        longtitude: json['longtitude'],
        created_by: json['created_by'],
        created_at: json['created_at'],
        active_flag: json['active_flag']);
  }

  Map<String, dynamic> toJSon() {
    return {
      'outlet_id': outlet_id,
      'outlet_name': outlet_name,
      'outlet_address': outlet_address,
      'area_id': area_id,
      'area_name': area_name,
      'photo': photo,
      'latitude': latitude,
      'longtitude': longtitude,
      'created_at': created_at,
      'created_by': created_by,
      'active_flag': active_flag,
    };
  }
}

class OutletResponse {
  int? status;
  String? messages;
  List<modelOutlet>? data;

  OutletResponse({
    this.status,
    this.messages,
    this.data,
  });

  factory OutletResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<modelOutlet> outletlist =
        list.map((i) => modelOutlet.fromJson(i)).toList();

    return OutletResponse(
      status: json['status'],
      messages: json['messages'],
      data: outletlist,
    );
  }
  Map<String, dynamic> toJSon() {
    return {
      'status': status,
      'messages': messages,
      'data': data?.map((modelOutlet) => modelOutlet.toJSon()).toList()
    };
  }
}
