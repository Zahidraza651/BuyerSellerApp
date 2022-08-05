class RequestStatusList {
<<<<<<< HEAD
  //bool? success;
=======
  bool? success;
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
  List<RequestDetailData> requestData;

  RequestStatusList({
    required this.requestData,
<<<<<<< HEAD
  });

  factory RequestStatusList.fromjson(List<dynamic> reqjson) {
    return RequestStatusList(
      requestData: reqjson.map((e) => RequestDetailData.fromjson(e)).toList(),
      //success: reqjson['success']
=======
    required this.success,
  });

  factory RequestStatusList.fromjson(Map<String, dynamic> reqjson) {
    var list = reqjson['data'] as List;
    return RequestStatusList(
      //requestData: reqjson.map((e) => RequestDetailData.fromjson(e)).toList(),
      success: reqjson['success'],
      requestData: list.map((e) => RequestDetailData.fromjson(e)).toList(),
>>>>>>> acfb8e063a2dd0639e4b385f4beea358d29ff1b7
    );
  }
}

class RequestDetailData {
  var attachment;
  String? createdAt;
  String? details;
  int? id;
  String? item_type;
  String? price;
  int? status;
  String? updatedAt;
  int? userID;

  RequestDetailData({
    required this.attachment,
    required this.createdAt,
    required this.details,
    required this.id,
    required this.item_type,
    required this.price,
    required this.status,
    required this.updatedAt,
    required this.userID,
  });

  factory RequestDetailData.fromjson(Map<String, dynamic> json) {
    return RequestDetailData(
        attachment: json['attachment'],
        createdAt: json['created_at'],
        details: json['details'],
        id: json['id'],
        item_type: json['item_type'],
        price: json['price'],
        status: json['status'],
        updatedAt: json['updatedAt'],
        userID: json['userID']);
  }
}
