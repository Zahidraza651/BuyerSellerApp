class RequestStatusList {
  //bool? success;
  List<RequestDetailData> requestData;

  RequestStatusList({
    required this.requestData,
  });

  factory RequestStatusList.fromjson(List<dynamic> reqjson) {
    return RequestStatusList(
      requestData: reqjson.map((e) => RequestDetailData.fromjson(e)).toList(),
      //success: reqjson['success']
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
