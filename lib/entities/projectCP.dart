import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class ProjectCP {
  int ID;
  String post_author;
  String post_date;
  String post_content;
  String post_title;
  String post_status;
  String post_name;
  String post_modified;
  String post_guid;
  int menu_order;
  String post_type;
  String filter;
  List<FeaturedImage> featured_image;
  List<MetaData> meta_data;
  List<Country> country;
  List<BusinessLine> business_line;
  List<Grouping> grouping;
  List<Status> status;
  List<Gallery> gallery;

  ProjectCP(
      {this.ID,
      this.post_author,
      this.post_date,
      this.post_content,
      this.post_title,
      this.post_status,
      this.post_name,
      this.post_modified,
      this.post_guid,
      this.menu_order,
      this.post_type,
      this.filter,
      this.featured_image,
      this.meta_data,
      this.country,
      this.business_line,
      this.grouping,
      this.status,
      this.gallery});

  factory ProjectCP.fromJson(Map<String, dynamic> json) {
    return ProjectCP(
        ID: json['ID'],
        post_author: json['post_author'],
        post_date: json['post_date'],
        post_content: json['post_content'],
        post_title: json['post_title'],
        post_status: json['post_status'],
        post_name: json['post_name'],
        post_modified: json['post_modified'],
        post_guid: json['post_guid'],
        menu_order: json['menu_order'],
        post_type: json['post_type'],
        filter: json['filter'],
        featured_image: parseFeaturedImage(json),
        meta_data: parseMetaData(json),
        country: parseCountry(json),
        business_line: parseBusinessLine(json),
        grouping: parseGrouping(json),
        status: parseStatus(json),
        gallery: parseGallery(json));
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

  static List<Country> parseCountry(countryJson) {
    var list = countryJson['country'] as List;
    List<Country> countryList =
        list.map((data) => Country.fromJson(data)).toList();
    return countryList;
  }

  static List<BusinessLine> parseBusinessLine(businessLineJson) {
    var list = businessLineJson['business_line'] as List;
    List<BusinessLine> businessLineList =
        list.map((data) => BusinessLine.fromJson(data)).toList();
    return businessLineList;
  }

  static List<Grouping> parseGrouping(groupingJson) {
    var list = groupingJson['grouping'] as List;
    List<Grouping> groupingList =
        list.map((data) => Grouping.fromJson(data)).toList();
    return groupingList;
  }

  static List<Status> parseStatus(statusJson) {
    var list = statusJson['status'] as List;
    List<Status> statusList =
        list.map((data) => Status.fromJson(data)).toList();
    return statusList;
  }

  static List<Gallery> parseGallery(galleryJson) {
    var list = galleryJson['gallery'] as List;
    List<Gallery> galleryList =
        list.map((data) => Gallery.fromJson(data)).toList();
    return galleryList;
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
  final String city;
  final String year;
  final String main_contractor;
  final String employer;
  final String duration;
  final String expected_end;
  final String price;
  final String man_hour;
  final List<String> awards;
  final String images;
  final bool is_featured;

  MetaData(
      {this.city,
      this.year,
      this.main_contractor,
      this.employer,
      this.duration,
      this.expected_end,
      this.price,
      this.man_hour,
      this.awards,
      this.images,
      this.is_featured});

  factory MetaData.fromJson(Map<String, dynamic> parsedJson) {
    return MetaData(
        city: parsedJson['city'],
        year: parsedJson['year'],
        main_contractor: parsedJson['main_contractor'],
        employer: parsedJson['employer'],
        duration: parsedJson['duration'],
        expected_end: parsedJson['expected_end'],
        price: parsedJson['price'],
        man_hour: parsedJson['man_hour'],
        awards: parseAwards(parsedJson['awards']),
        images: parsedJson['images'],
        is_featured: parsedJson['is_featured']);
  }

  static List<String> parseAwards(awardsJson) {
    List<String> awardsList;
    if (awardsJson.toString().length > 0)
       awardsList = new List<String>.from(awardsJson);
    else
      awardsList = new List<String>();

    return awardsList;
  }
}

@JsonSerializable()
class Country {
  final int term_id;
  final String name;
  final String slug;
  final int term_group;
  final int term_taxonomy_id;
  final String taxonomy;
  final String description;
  final int parent;
  final int count;
  final String filter;

  Country(
      {this.term_id,
      this.name,
      this.slug,
      this.term_group,
      this.term_taxonomy_id,
      this.taxonomy,
      this.description,
      this.parent,
      this.count,
      this.filter,
      });

  factory Country.fromJson(Map<String, dynamic> parsedJson) {
    return Country(
        term_id: parsedJson['term_id'],
        name: parsedJson['name'],
        slug: parsedJson['slug'],
        term_taxonomy_id: parsedJson['term_taxonomy_id'],
        taxonomy: parsedJson['taxonomy'],
        description: parsedJson['description'],
        parent: parsedJson['parent'],
        count: parsedJson['count'],
        filter: parsedJson['filter']
        );
  }
}

@JsonSerializable()
class BusinessLine {
  final int term_id;
  final String name;
  final String slug;
  final int term_group;
  final int term_taxonomy_id;
  final String taxonomy;
  final String description;
  final int parent;
  final int count;
  final String filter;

  BusinessLine(
      {this.term_id,
      this.name,
      this.slug,
      this.term_group,
      this.term_taxonomy_id,
      this.taxonomy,
      this.description,
      this.parent,
      this.count,
      this.filter,
      });

  factory BusinessLine.fromJson(Map<String, dynamic> parsedJson) {
    return BusinessLine(
        term_id: parsedJson['term_id'],
        name: parsedJson['name'],
        slug: parsedJson['slug'],
        term_taxonomy_id: parsedJson['term_taxonomy_id'],
        taxonomy: parsedJson['taxonomy'],
        description: parsedJson['description'],
        parent: parsedJson['parent'],
        count: parsedJson['count'],
        filter: parsedJson['filter']
       );
  }
}

@JsonSerializable()
class Grouping {
  final int term_id;
  final String name;
  final String slug;
  final int term_group;
  final int term_taxonomy_id;
  final String taxonomy;
  final String description;
  final int parent;
  final int count;
  final String filter;

  Grouping(
      {this.term_id,
      this.name,
      this.slug,
      this.term_group,
      this.term_taxonomy_id,
      this.taxonomy,
      this.description,
      this.parent,
      this.count,
      this.filter,
      });

  factory Grouping.fromJson(Map<String, dynamic> parsedJson) {
    return Grouping(
        term_id: parsedJson['term_id'],
        name: parsedJson['name'],
        slug: parsedJson['slug'],
        term_taxonomy_id: parsedJson['term_taxonomy_id'],
        taxonomy: parsedJson['taxonomy'],
        description: parsedJson['description'],
        parent: parsedJson['parent'],
        count: parsedJson['count'],
        filter: parsedJson['filter']);
  }
}

@JsonSerializable()
class Status {
  final int term_id;
  final String name;
  final String slug;
  final int term_group;
  final int term_taxonomy_id;
  final String taxonomy;
  final String description;
  final int parent;
  final int count;
  final String filter;

  Status(
      {this.term_id,
      this.name,
      this.slug,
      this.term_group,
      this.term_taxonomy_id,
      this.taxonomy,
      this.description,
      this.parent,
      this.count,
      this.filter});

  factory Status.fromJson(Map<String, dynamic> parsedJson) {
    return Status(
        term_id: parsedJson['term_id'],
        name: parsedJson['name'],
        slug: parsedJson['slug'],
        term_taxonomy_id: parsedJson['term_taxonomy_id'],
        taxonomy: parsedJson['taxonomy'],
        description: parsedJson['description'],
        parent: parsedJson['parent'],
        count: parsedJson['count'],
        filter: parsedJson['filter']);
  }
}

@JsonSerializable()
class Gallery {
  final String id;
  final String full;
  final String large;
  final String medium;
  final String thumb;

  Gallery({this.id, this.full, this.large, this.medium, this.thumb});

  factory Gallery.fromJson(Map<String, dynamic> parsedJson) {
    return Gallery(
        id: parsedJson['id'],
        full: parsedJson['full'],
        large: parsedJson['large'],
        medium: parsedJson['medium'],
        thumb: parsedJson['thumb']);
  }
}
