import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Project {
  int ID;
  String post_author;
  String post_date;
  String post_content;
  String post_title;
  String post_status;
  String post_name;
  String post_modified;
  String post_guid;
  String menu_order;
  String post_type;
  String filter;
  List<FeaturedImage> featured_image;
  List<MetaData> meta_data;
  List<Country> country;
  List<BusinessLine> business_line;
  List<Grouping> grouping;
  List<Status> status;
  List<Gallery> gallery;

  Project(
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

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
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
    List<FeaturedImage> featuredImageList = list.map((data)=>FeaturedImage.fromJson(data)).toList();
    return featuredImageList;
  }

  static List<MetaData> parseMetaData(metaDataJson){
    var list = metaDataJson['meta_data'] as List;
    List<MetaData> metaDataList = list.map((data)=>MetaData.fromJson(data)).toList();
    return metaDataList;
  }

  static List<Country> parseCountry(countryJson){
    var list = countryJson['country'] as List;
    List<Country> countryList = list.map((data)=>Country.fromJson(data)).toList();
    return countryList;
  }

  static List<BusinessLine> parseBusinessLine(businessLineJson){
    var list = businessLineJson['business_line'] as List;
    List<BusinessLine> businessLineList = list.map((data)=>BusinessLine.fromJson(data)).toList();
    return businessLineList;
  }

  static List<Grouping> parseGrouping(groupingJson){
    var list = groupingJson['grouping'] as List;
    List<Grouping> groupingList = list.map((data)=>Grouping.fromJson(data)).toList();
    return groupingList;
  }

  static List<Status> parseStatus(statusJson){
    var list = statusJson['status'] as List;
    List<Status> statusList = list.map((data)=>Status.fromJson(data)).toList();
    return statusList;
  }

  static List<Gallery> parseGallery(galleryJson){
    var list = galleryJson['gallery'] as List;
    List<Gallery> galleryList = list.map((data)=>Gallery.fromJson(data)).toList();
    return galleryList;
  }


}

class FeaturedImage {
  String full;
  String large;
  String medium;
  String thumb;

  FeaturedImage({this.full, this.large, this.medium, this.thumb});

  factory FeaturedImage.fromJson(Map<String, dynamic> parsedJson) {
    return FeaturedImage(
        full: parsedJson['full'],
        large: parsedJson['large'],
        medium: parsedJson['medium'],
        thumb: parsedJson['thumb']);
  }
}

class MetaData {
  String city;
  String year;
  String main_contractor;
  String employer;
  String duration;
  String expected_end;
  String price;
  String man_hour;
  String awards;
  String images;
  String is_featured;

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
        awards: parsedJson['awards'],
        images: parsedJson['images'],
        is_featured: parsedJson['is_featured']);
  }
}

class Country {
  int term_id;
  String name;
  String slug;
  int term_group;
  int term_taxonomy_id;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  String term_order;

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
      this.term_order});

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
        filter: parsedJson['filter'],
        term_order: parsedJson['term_order']);
  }
}

class BusinessLine {
  int term_id;
  String name;
  String slug;
  int term_group;
  int term_taxonomy_id;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  int term_order;

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
      this.term_order});

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
        filter: parsedJson['filter'],
        term_order: parsedJson['term_order']);
  }
}

class Grouping {
  int term_id;
  String name;
  String slug;
  int term_group;
  int term_taxonomy_id;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  int term_order;

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
      this.term_order});

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
        filter: parsedJson['filter'],
        term_order: parsedJson['term_order']);
  }
}

class Status {
  int term_id;
  String name;
  String slug;
  int term_group;
  int term_taxonomy_id;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  int term_order;

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
      this.filter,
      this.term_order});

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
        filter: parsedJson['filter'],
        term_order: parsedJson['term_order']);
  }
}

class Gallery {
  int id;
  String full;
  String large;
  String medium;
  String thumb;

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
