import 'dart:convert';

class Country {
  final int rang;
  final String name,
      description,
      dateQualification,
      lastParticipation,
      flag,
      countryCode,
      topPlayer;
  final int nbParticipation;
  final List<int> results;

  Country({
    required this.rang,
    required this.name,
    required this.description,
    required this.dateQualification,
    required this.nbParticipation,
    required this.results,
    required this.lastParticipation,
    required this.flag,
    required this.countryCode,
    required this.topPlayer,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        rang: json["rang"],
        name: json["name"],
        description: json["description"],
        dateQualification: json["date_qualification"],
        nbParticipation: json["nb_participation"],
        results: json["results"] == null
            ? []
            : List<int>.from(json["results"]!.map((x) => x)),
        lastParticipation: json["last_participation"],
        flag: json["flag"],
        countryCode: json["countryCode"],
        topPlayer: json["top_player"],
      );

  Map<String, dynamic> toJson() => {
        "rang": rang,
        "name": name,
        "description": description,
        "date_qualification": dateQualification,
        "nb_participation": nbParticipation,
        "results":
            results.isEmpty ? [] : List<dynamic>.from(results.map((x) => x)),
        "last_participation": lastParticipation,
        "flag": flag,
        "countryCode": countryCode,
        "top_player": topPlayer,
      };
}
