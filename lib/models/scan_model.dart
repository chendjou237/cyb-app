import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScanModel {
  final int errors;
  final int date;
  final String action;
  ScanModel({
    required this.errors,
    required this.date,
    required this.action,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'errors': errors,
      'date': date,
      'action': action,
    };
  }

  factory ScanModel.fromMap(Map<String, dynamic> map) {
    return ScanModel(
      errors: map['errors'] as int,
      date: map['date'] as int,
      action: map['action'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScanModel.fromJson(String source) => ScanModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
