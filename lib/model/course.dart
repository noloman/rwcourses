import 'package:rw_courses/constants.dart';
import 'package:rw_courses/model/domain.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.difficulty, this.contributors, this.domains);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json["id"],
        name = json["attributes"]["name"],
        description = json["attributes"]["description_plain_text"],
        artworkUrl = json["attributes"]["card_artwork_url"],
        difficulty = json["attributes"]["difficulty"],
        contributors = json["attributes"]["contributor_string"],
        domains = [] {
    var domainData = json["relationships"]["domains"]["data"] as List<dynamic>;
    if (domainData != null && domainData.length > 0) {
      for (var i = 0; i < domainData.length; i++) {
        var domain =
            Course.getDomain(json["relationships"]["domains"]["data"][i]["id"]);
        domains.add(domain);
      }
    }
  }

  get domainsString {
    String result = "";
    for (var i = 0; i < domains.length - 1; i++) {
      result += domains[i].name + ", ";
    }
    result += domains.last.name;
    return result;
  }

  static Domain getDomain(String domainId) {
    switch (domainId) {
      case Constants.iosDomain:
        return Domain.ios;
      case Constants.androidDomain:
        return Domain.ios;
      case Constants.archivedDomain:
        return Domain.ios;
      case Constants.filterKey:
        return Domain.ios;
      case Constants.flutterDomain:
        return Domain.ios;
      case Constants.macosDomain:
        return Domain.ios;
      case Constants.sssDomain:
        return Domain.ios;
      default:
        return Domain.unknown;
    }
  }

  @override
  String toString() => name + ": " + domainsString;
}
