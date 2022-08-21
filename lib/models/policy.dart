class Policy {
  bool? success;
  PolicyData? data;

  Policy({required this.data, required this.success});

  factory Policy.fromJson(Map<String, dynamic> pjson) {
    return Policy(data: PolicyData.fromJson(pjson['data']), success: pjson['success']);
  }
}

class PolicyData {
  String? text;
  String? type;

  PolicyData({required this.text, required this.type});

  factory PolicyData.fromJson(Map<String, dynamic> json) {
    return PolicyData(text: json['text'], type: json['type']);
  }
}
