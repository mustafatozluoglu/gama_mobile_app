import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class ProjectBOT {
  int ID;
  String post_author;
  String post_date;
  String post_date_gmt;
  String post_content;
  String post_title;
  String post_status;
  String post_name;
  String post_modified;
  String post_modified_gmt;
  String guid;
  int menu_order;
  String post_type;
  String filter;
  List<FeaturedImage> featured_image;
  List<MetaData> meta_data;

  ProjectBOT({
    this.ID,
    this.post_author,
    this.post_date,
    this.post_date_gmt,
    this.post_content,
    this.post_title,
    this.post_status,
    this.post_name,
    this.post_modified,
    this.post_modified_gmt,
    this.guid,
    this.menu_order,
    this.post_type,
    this.filter,
    this.featured_image,
    this.meta_data,
  });

  factory ProjectBOT.fromJson(Map<String, dynamic> json) {
    return ProjectBOT(
        ID: json['ID'],
        post_author: json['post_author'],
        post_date: json['post_date'],
        post_content: json['post_content'],
        post_title: json['post_title'],
        post_status: json['post_status'],
        post_name: json['post_name'],
        post_modified: json['post_modified'],
        post_modified_gmt: json['post_modified_gmt'],
        guid: json['guid'],
        menu_order: json['menu_order'],
        post_type: json['post_type'],
        filter: json['filter'],
        featured_image: parseFeaturedImage(json),
        meta_data: parseMetaData(json));
  }

  static List<FeaturedImage> parseFeaturedImage(featuredImageJson) {
    var list = featuredImageJson['featured_image'] as List;
    List<FeaturedImage> featuredImageList =
        list.map((data) => FeaturedImage.fromJson(data)).toList();
    return featuredImageList;
  }

  static List<MetaData> parseMetaData(metaDataJson) {
    var list = metaDataJson['meta_data'] as List;
    List<MetaData> metaDataList =
        list.map((data) => MetaData.fromJson(data)).toList();
    return metaDataList;
  }
}

@JsonSerializable()
class FeaturedImage {
  final String full;
  final String large;
  final String medium;
  final String thumb;

  FeaturedImage({this.full, this.large, this.medium, this.thumb});

  factory FeaturedImage.fromJson(Map<String, dynamic> parsedJson) {
    return FeaturedImage(
        full: parsedJson['full'] as String,
        large: parsedJson['large'] as String,
        medium: parsedJson['medium'] as String,
        thumb: parsedJson['thumb'] as String);
  }
}

@JsonSerializable()
class MetaData {
  final String location;
  final String commercial_operation;
  final String concession_period;
  final String investment_amount;

  MetaData(
      {this.location,
      this.commercial_operation,
      this.concession_period,
      this.investment_amount});

  factory MetaData.fromJson(Map<String, dynamic> parsedJson) {
    return MetaData(
      location: parsedJson['location'],
      commercial_operation: parsedJson['commercial_operation'],
      concession_period: parsedJson['concession_period'],
      investment_amount: parsedJson['investment_amount'],
    );
  }
}
