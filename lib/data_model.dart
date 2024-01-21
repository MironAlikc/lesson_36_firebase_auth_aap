class DataModel {
  String? data;
  String? image;

  DataModel({this.data, this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    data['image'] = image;
    return data;
  }
}
