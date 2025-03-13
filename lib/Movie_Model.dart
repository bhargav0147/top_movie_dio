// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  String? id;
  String? url;
  String? primaryTitle;
  String? originalTitle;
  String? type;
  String? description;
  String? primaryImage;
  String? contentRating;
  int? startYear;
  int? endYear;
  DateTime? releaseDate;
  List<String>? interests;
  List<String>? countriesOfOrigin;
  List<String>? externalLinks;
  List<String>? spokenLanguages;
  List<String>? filmingLocations;
  List<ProductionCompany>? productionCompanies;
  double? budget;
  double? grossWorldwide;
  List<String>? genres;
  bool? isAdult;
  int? runtimeMinutes;
  double? averageRating;
  int? numVotes;

  MovieModel({
    this.id,
    this.url,
    this.primaryTitle,
    this.originalTitle,
    this.type,
    this.description,
    this.primaryImage,
    this.contentRating,
    this.startYear,
    this.endYear,
    this.releaseDate,
    this.interests,
    this.countriesOfOrigin,
    this.externalLinks,
    this.spokenLanguages,
    this.filmingLocations,
    this.productionCompanies,
    this.budget,
    this.grossWorldwide,
    this.genres,
    this.isAdult,
    this.runtimeMinutes,
    this.averageRating,
    this.numVotes,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    url: json["url"],
    primaryTitle: json["primaryTitle"],
    originalTitle: json["originalTitle"],
    type: json["type"],
    description: json["description"],
    primaryImage: json["primaryImage"],
    contentRating: json["contentRating"],
    startYear: json["startYear"],
    endYear: json["endYear"],
    releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
    interests: json["interests"] == null ? [] : List<String>.from(json["interests"]!.map((x) => x)),
    countriesOfOrigin: json["countriesOfOrigin"] == null ? [] : List<String>.from(json["countriesOfOrigin"]!.map((x) => x)),
    externalLinks: json["externalLinks"] == null ? [] : List<String>.from(json["externalLinks"]!.map((x) => x)),
    spokenLanguages: json["spokenLanguages"] == null ? [] : List<String>.from(json["spokenLanguages"]!.map((x) => x)),
    filmingLocations: json["filmingLocations"] == null ? [] : List<String>.from(json["filmingLocations"]!.map((x) => x)),
    productionCompanies: json["productionCompanies"] == null ? [] : List<ProductionCompany>.from(json["productionCompanies"]!.map((x) => ProductionCompany.fromJson(x))),
    budget: json["budget"]?.toDouble(),
    grossWorldwide: json["grossWorldwide"]?.toDouble(),
    genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
    isAdult: json["isAdult"],
    runtimeMinutes: json["runtimeMinutes"],
    averageRating: json["averageRating"]?.toDouble(),
    numVotes: json["numVotes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "primaryTitle": primaryTitle,
    "originalTitle": originalTitle,
    "type": type,
    "description": description,
    "primaryImage": primaryImage,
    "contentRating": contentRating,
    "startYear": startYear,
    "endYear": endYear,
    "releaseDate": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
    "countriesOfOrigin": countriesOfOrigin == null ? [] : List<dynamic>.from(countriesOfOrigin!.map((x) => x)),
    "externalLinks": externalLinks == null ? [] : List<dynamic>.from(externalLinks!.map((x) => x)),
    "spokenLanguages": spokenLanguages == null ? [] : List<dynamic>.from(spokenLanguages!.map((x) => x)),
    "filmingLocations": filmingLocations == null ? [] : List<dynamic>.from(filmingLocations!.map((x) => x)),
    "productionCompanies": productionCompanies == null ? [] : List<dynamic>.from(productionCompanies!.map((x) => x.toJson())),
    "budget": budget,
    "grossWorldwide": grossWorldwide,
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
    "isAdult": isAdult,
    "runtimeMinutes": runtimeMinutes,
    "averageRating": averageRating,
    "numVotes": numVotes,
  };
}

class ProductionCompany {
  String? id;
  String? name;

  ProductionCompany({
    this.id,
    this.name,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
