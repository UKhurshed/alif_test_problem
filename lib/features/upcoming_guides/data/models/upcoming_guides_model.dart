class UpcomingGuidesModel {
  UpcomingGuidesModel({
    required this.data,
    required this.total,
  });

  List<Datum> data;
  String total;

  factory UpcomingGuidesModel.fromJson(Map<String, dynamic> json) =>
      UpcomingGuidesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );
}

class Datum {
  Datum({
    this.url,
    this.startDate,
    this.endDate,
    this.name,
    this.icon,
    this.venue,
    this.objType,
    this.loginRequired,
  });

  String? url;
  String? startDate;
  String? endDate;
  String? name;
  String? icon;
  Venue? venue;
  String? objType;
  bool? loginRequired;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        url: json["url"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        name: json["name"],
        icon: json["icon"],
        venue: Venue.fromJson(json["venue"]),
        objType: json["objType"],
        loginRequired: json["loginRequired"],
      );
}

class Venue {
  Venue();

  factory Venue.fromJson(Map<String, dynamic> json) => Venue();

  Map<String, dynamic> toJson() => {};
}
