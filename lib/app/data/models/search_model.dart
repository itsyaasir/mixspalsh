// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.total,
    this.totalPages,
    this.results,
  });

  int total;
  int totalPages;
  List<Result> results;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        total: json["total"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
    this.tags,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String description;
  String altDescription;
  Urls urls;
  ResultLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  Sponsorship sponsorship;
  ResultTopicSubmissions topicSubmissions;
  User user;
  List<Tag> tags;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"] == null ? null : json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"] == null
            ? null
            : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions:
            ResultTopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt == null ? null : promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description == null ? null : description,
        "alt_description": altDescription == null ? null : altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship == null ? null : sponsorship.toJson(),
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
      };
}

class ResultLinks {
  ResultLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Sponsorship {
  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  List<String> impressionUrls;
  String tagline;
  String taglineUrl;
  User sponsor;

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls:
            List<String>.from(json["impression_urls"].map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: User.fromJson(json["sponsor"]),
      );

  Map<String, dynamic> toJson() => {
        "impression_urls": List<dynamic>.from(impressionUrls.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor.toJson(),
      };
}

class User {
  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String location;
  UserLinks links;
  ProfileImage profileImage;
  String instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;
  bool forHire;
  Social social;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        twitterUsername:
            json["twitter_username"] == null ? null : json["twitter_username"],
        portfolioUrl:
            json["portfolio_url"] == null ? null : json["portfolio_url"],
        bio: json["bio"] == null ? null : json["bio"],
        location: json["location"] == null ? null : json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"] == null
            ? null
            : json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
        "bio": bio == null ? null : bio,
        "location": location == null ? null : location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username":
            instagramUsername == null ? null : instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
      };
}

class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String small;
  String medium;
  String large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  String instagramUsername;
  String portfolioUrl;
  String twitterUsername;
  dynamic paypalEmail;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"] == null
            ? null
            : json["instagram_username"],
        portfolioUrl:
            json["portfolio_url"] == null ? null : json["portfolio_url"],
        twitterUsername:
            json["twitter_username"] == null ? null : json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toJson() => {
        "instagram_username":
            instagramUsername == null ? null : instagramUsername,
        "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "paypal_email": paypalEmail,
      };
}

class Tag {
  Tag({
    this.type,
    this.title,
    this.source,
  });

  Type type;
  String title;
  Source source;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        type: typeValues.map[json["type"]],
        title: json["title"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
        "source": source == null ? null : source.toJson(),
      };
}

class Source {
  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  CoverPhoto coverPhoto;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        ancestry: Ancestry.fromJson(json["ancestry"]),
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
      );

  Map<String, dynamic> toJson() => {
        "ancestry": ancestry.toJson(),
        "title": title,
        "subtitle": subtitle,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "cover_photo": coverPhoto.toJson(),
      };
}

class Ancestry {
  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  Category type;
  Category category;
  Category subcategory;

  factory Ancestry.fromJson(Map<String, dynamic> json) => Ancestry(
        type: Category.fromJson(json["type"]),
        category: Category.fromJson(json["category"]),
        subcategory: Category.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category.toJson(),
        "subcategory": subcategory.toJson(),
      };
}

class Category {
  Category({
    this.slug,
    this.prettySlug,
  });

  String slug;
  String prettySlug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        slug: json["slug"],
        prettySlug: json["pretty_slug"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

class CoverPhoto {
  CoverPhoto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String blurHash;
  String description;
  String altDescription;
  Urls urls;
  ResultLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  CoverPhotoTopicSubmissions topicSubmissions;
  User user;

  factory CoverPhoto.fromJson(Map<String, dynamic> json) => CoverPhoto(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"] == null
            ? null
            : DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"] == null ? null : json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions:
            CoverPhotoTopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt == null ? null : promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description == null ? null : description,
        "alt_description": altDescription == null ? null : altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
      };
}

class CoverPhotoTopicSubmissions {
  CoverPhotoTopicSubmissions({
    this.texturesPatterns,
    this.wallpapers,
    this.nature,
  });

  Architecture texturesPatterns;
  Architecture wallpapers;
  Architecture nature;

  factory CoverPhotoTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      CoverPhotoTopicSubmissions(
        texturesPatterns: json["textures-patterns"] == null
            ? null
            : Architecture.fromJson(json["textures-patterns"]),
        wallpapers: json["wallpapers"] == null
            ? null
            : Architecture.fromJson(json["wallpapers"]),
        nature: json["nature"] == null
            ? null
            : Architecture.fromJson(json["nature"]),
      );

  Map<String, dynamic> toJson() => {
        "textures-patterns":
            texturesPatterns == null ? null : texturesPatterns.toJson(),
        "wallpapers": wallpapers == null ? null : wallpapers.toJson(),
        "nature": nature == null ? null : nature.toJson(),
      };
}

class Architecture {
  Architecture({
    this.status,
    this.approvedOn,
  });

  Status status;
  DateTime approvedOn;

  factory Architecture.fromJson(Map<String, dynamic> json) => Architecture(
        status: statusValues.map[json["status"]],
        approvedOn: DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn.toIso8601String(),
      };
}

enum Status { APPROVED }

final statusValues = EnumValues({"approved": Status.APPROVED});

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

enum Type { LANDING_PAGE, SEARCH }

final typeValues =
    EnumValues({"landing_page": Type.LANDING_PAGE, "search": Type.SEARCH});

class ResultTopicSubmissions {
  ResultTopicSubmissions({
    this.businessWork,
    this.work,
    this.architecture,
    this.technology,
    this.interiors,
  });

  Architecture businessWork;
  Architecture work;
  Architecture architecture;
  Architecture technology;
  Architecture interiors;

  factory ResultTopicSubmissions.fromJson(Map<String, dynamic> json) =>
      ResultTopicSubmissions(
        businessWork: json["business-work"] == null
            ? null
            : Architecture.fromJson(json["business-work"]),
        work: json["work"] == null ? null : Architecture.fromJson(json["work"]),
        architecture: json["architecture"] == null
            ? null
            : Architecture.fromJson(json["architecture"]),
        technology: json["technology"] == null
            ? null
            : Architecture.fromJson(json["technology"]),
        interiors: json["interiors"] == null
            ? null
            : Architecture.fromJson(json["interiors"]),
      );

  Map<String, dynamic> toJson() => {
        "business-work": businessWork == null ? null : businessWork.toJson(),
        "work": work == null ? null : work.toJson(),
        "architecture": architecture == null ? null : architecture.toJson(),
        "technology": technology == null ? null : technology.toJson(),
        "interiors": interiors == null ? null : interiors.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
