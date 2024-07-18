import 'dart:convert';
/// success : true
/// message : "Photos fetched successfully"
/// offset : 0
/// limit : 10
/// photos : [{"description":"Leader structure safe or black late wife newspaper her pick central forget single likely.","url":"https://api.slingacademy.com/public/sample-photos/1.jpeg","title":"Defense the travel audience hand","id":1,"user":28},{"description":"Much technology how within rather him lay why part actually system increase feel.","url":"https://api.slingacademy.com/public/sample-photos/2.jpeg","title":"Space build policy people model treatment town hard use","id":2,"user":25},{"description":"Street anything piece south yard since well point summer school economy respond people mother.","url":"https://api.slingacademy.com/public/sample-photos/3.jpeg","title":"Party about different guess bill too owner","id":3,"user":7},{"description":"Skill drug college contain herself future seat human yes approach how then maybe public summer play commercial anything woman include million body measure government clearly question quickly parent.","url":"https://api.slingacademy.com/public/sample-photos/4.jpeg","title":"Table husband","id":4,"user":22},{"description":"World early north TV around meet goal across reason responsibility have must build up some language soon.","url":"https://api.slingacademy.com/public/sample-photos/5.jpeg","title":"Support audience model program three music","id":5,"user":25},{"description":"Training beautiful age four skin cultural hundred environmental ability blood go physical relate produce tough open police.","url":"https://api.slingacademy.com/public/sample-photos/6.jpeg","title":"Apply future response she reduce decide","id":6,"user":30},{"description":"Few address take for special development white career.","url":"https://api.slingacademy.com/public/sample-photos/7.jpeg","title":"Fire year candidate too like","id":7,"user":20},{"description":"Drug if approach out according set home job company wall source trouble act huge easy style physical so month.","url":"https://api.slingacademy.com/public/sample-photos/8.jpeg","title":"Reflect design camera land girl wind behind side","id":8,"user":13},{"description":"Nature focus wonder behind magazine pattern degree far without tree consider.","url":"https://api.slingacademy.com/public/sample-photos/9.jpeg","title":"Per nature research","id":9,"user":2},{"description":"Parent talk collection fill between management purpose fish fight real teacher successful me arrive little.","url":"https://api.slingacademy.com/public/sample-photos/10.jpeg","title":"Yard","id":10,"user":30}]

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());
class ProductModel {
  ProductModel({
      bool? success, 
      String? message, 
      num? offset, 
      num? limit, 
      List<Photos>? photos,}){
    _success = success;
    _message = message;
    _offset = offset;
    _limit = limit;
    _photos = photos;
}

  ProductModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _offset = json['offset'];
    _limit = json['limit'];
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(Photos.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  num? _offset;
  num? _limit;
  List<Photos>? _photos;

  get data => null;


ProductModel copyWith({  bool? success,
  String? message,
  num? offset,
  num? limit,
  List<Photos>? photos,
}) => ProductModel(  success: success ?? _success,
  message: message ?? _message,
  offset: offset ?? _offset,
  limit: limit ?? _limit,
  photos: photos ?? _photos,
);
  bool? get success => _success;
  String? get message => _message;
  num? get offset => _offset;
  num? get limit => _limit;
  List<Photos>? get photos => _photos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['offset'] = _offset;
    map['limit'] = _limit;
    if (_photos != null) {
      map['photos'] = _photos?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// description : "Leader structure safe or black late wife newspaper her pick central forget single likely."
/// url : "https://api.slingacademy.com/public/sample-photos/1.jpeg"
/// title : "Defense the travel audience hand"
/// id : 1
/// user : 28

Photos photosFromJson(String str) => Photos.fromJson(json.decode(str));
String photosToJson(Photos data) => json.encode(data.toJson());
class Photos {
  Photos({
      String? description, 
      String? url, 
      String? title, 
      num? id, 
      num? user,}){
    _description = description;
    _url = url;
    _title = title;
    _id = id;
    _user = user;
}

  Photos.fromJson(dynamic json) {
    _description = json['description'];
    _url = json['url'];
    _title = json['title'];
    _id = json['id'];
    _user = json['user'];
  }
  String? _description;
  String? _url;
  String? _title;
  num? _id;
  num? _user;
Photos copyWith({  String? description,
  String? url,
  String? title,
  num? id,
  num? user,
}) => Photos(  description: description ?? _description,
  url: url ?? _url,
  title: title ?? _title,
  id: id ?? _id,
  user: user ?? _user,
);
  String? get description => _description;
  String? get url => _url;
  String? get title => _title;
  num? get id => _id;
  num? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = _description;
    map['url'] = _url;
    map['title'] = _title;
    map['id'] = _id;
    map['user'] = _user;
    return map;
  }

}