import 'dart:convert';

typedef T JsonBuilder<T>(data);

class BaseResp<T> {
  int code;
  String msg;
  T data;

  factory BaseResp(jsonStr, JsonBuilder<T> buildFun) =>
      jsonStr is String ? BaseResp.fromJson(json.decode(jsonStr), buildFun) : BaseResp.fromJson(jsonStr, buildFun);

  BaseResp.fromJson(jsonRes, JsonBuilder<T> buildFun) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];

    /// 这里可以做code和msg的处理逻辑
    data = buildFun(jsonRes['data']);
  }
}

class User {
  String name;
  String pwd;

  User.fromMap(Map<String, dynamic> data) {
    name = data["name"];
    pwd = data["pwd"];
  }
}

class UserResponse extends BaseResp<User> {
  factory UserResponse(jsonStr, JsonBuilder<User> buildFun) =>
      jsonStr is String ? BaseResp.fromJson(json.decode(jsonStr), buildFun) : BaseResp.fromJson(jsonStr, buildFun);
}

foo() {
  var str = """
  {"code":100,"msg":"成功","data":{"name":"123","pwd":"1234"}}
  """;
  UserResponse response = UserResponse(str, (data) => User.fromMap(data));
  print(response);
}
