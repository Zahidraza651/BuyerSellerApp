class SearchReq {
  final String requestid;

  SearchReq({required this.requestid});

  factory SearchReq.fromJson(Map<String, dynamic> json) {
    return SearchReq(
      requestid: json['request_id'],
    );
  }
}

class SearchReqData {
  bool? success;
  Data? data;

  SearchReqData({
    this.success,
    this.data,
  });

  SearchReqData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  int? userId;
  String? itemType;
  String? price;
  String? details;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? deliveryMethod;
  var paymentMethod;
  String? paymentStatus;
  int? sellerId;
  var attachment;

  Data(
      {required this.id,
      required this.userId,
      required this.itemType,
      required this.price,
      required this.details,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.deliveryMethod,
      required this.paymentMethod,
      required this.paymentStatus,
      required this.sellerId,
      required this.attachment});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    itemType = json['item_type'];
    price = json['price'];
    details = json['details'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryMethod = json['delivery_method'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    sellerId = json['seller_id'];
    if (json['attachment'] != null) {
      attachment = <String>[];
      json['attachment'].forEach((v) {
        attachment!.add((v));
      });
    }
  }
}
