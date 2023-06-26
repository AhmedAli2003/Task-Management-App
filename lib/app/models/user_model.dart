import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
  final int id;
  final bool isVerified;
  const UserModel({
    required this.id,
    required this.isVerified,
  });

  UserModel copyWith({
    int? id,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      isVerified: map['isVerified'] as bool,
    );
  }

  @override
  String toString() => 'UserModel(id: $id, isVerified: $isVerified)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.isVerified == isVerified;
  }

  @override
  int get hashCode => id.hashCode ^ isVerified.hashCode;

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
