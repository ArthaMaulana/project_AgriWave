class ResponseSignIn {
  String? accessToken;
  String? tokenType;
  List<Data>? data;

  ResponseSignIn({this.accessToken, this.tokenType, this.data});

  ResponseSignIn.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? unitId;
  String? roleId;
  String? phone;
  String? profilePict;
  String? job;
  String? email;
  String? rememberToken;
  String? createdAt;
  String? updatedAt;
  Unit? unit;
  Role? role;

  Data(
      {this.id,
      this.name,
      this.unitId,
      this.roleId,
      this.phone,
      this.profilePict,
      this.job,
      this.email,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.unit,
      this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    unitId = json['unit_id'];
    roleId = json['role_id'];
    phone = json['phone'];
    profilePict = json['profile_pict'];
    job = json['job'];
    email = json['email'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['unit_id'] = unitId;
    data['role_id'] = roleId;
    data['phone'] = phone;
    data['profile_pict'] = profilePict;
    data['job'] = job;
    data['email'] = email;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (unit != null) {
      data['unit'] = unit!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    return data;
  }
}

class Unit {
  int? id;
  String? unitName;
  String? createdAt;
  String? updatedAt;

  Unit({this.id, this.unitName, this.createdAt, this.updatedAt});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unitName = json['unit_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['unit_name'] = unitName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Role {
  int? id;
  String? roleName;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.roleName, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_name'] = roleName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
