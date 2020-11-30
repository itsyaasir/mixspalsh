// To parse this JSON data, do
//
//     final topicModel = topicModelFromJson(jsonString);

import 'dart:convert';

List<TopicModel> topicModelFromJson(String str) =>
    List<TopicModel>.from(json.decode(str).map((x) => TopicModel.fromJson(x)));

String topicModelToJson(List<TopicModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopicModel {
  TopicModel({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.publishedAt,
    this.updatedAt,
    this.startsAt,
    this.endsAt,
    this.featured,
    this.totalPhotos,
    this.currentUserContributions,
    this.totalCurrentUserSubmissions,
    this.links,
    this.status,
    this.owners,
    this.coverPhoto,
    this.previewPhotos,
  });

  String id;
  String slug;
  String title;
  String description;
  DateTime publishedAt;
  DateTime updatedAt;
  DateTime startsAt;
  dynamic endsAt;
  bool featured;
  int totalPhotos;
  List<dynamic> currentUserContributions;
  TotalCurrentUserSubmissions totalCurrentUserSubmissions;
  TopicModelLinks links;
  Status status;
  List<User> owners;
  CoverPhoto coverPhoto;
  List<PreviewPhoto> previewPhotos;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        description: json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        startsAt: DateTime.parse(json["starts_at"]),
        endsAt: json["ends_at"],
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        currentUserContributions: List<dynamic>.from(
            json["current_user_contributions"].map((x) => x)),
        totalCurrentUserSubmissions: TotalCurrentUserSubmissions.fromJson(
            json["total_current_user_submissions"]),
        links: TopicModelLinks.fromJson(json["links"]),
        status: statusValues.map[json["status"]],
        owners: List<User>.from(json["owners"].map((x) => User.fromJson(x))),
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "description": description,
        "published_at": publishedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "starts_at": startsAt.toIso8601String(),
        "ends_at": endsAt,
        "featured": featured,
        "total_photos": totalPhotos,
        "current_user_contributions":
            List<dynamic>.from(currentUserContributions.map((x) => x)),
        "total_current_user_submissions": totalCurrentUserSubmissions.toJson(),
        "links": links.toJson(),
        "status": statusValues.reverse[status],
        "owners": List<dynamic>.from(owners.map((x) => x.toJson())),
        "cover_photo": coverPhoto.toJson(),
        "preview_photos":
            List<dynamic>.from(previewPhotos.map((x) => x.toJson())),
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
  CoverPhotoLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
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
        altDescription: json["alt_description"],
        urls: Urls.fromJson(json["urls"]),
        links: CoverPhotoLinks.fromJson(json["links"]),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
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
        "alt_description": altDescription,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "user": user.toJson(),
      };
}

class CoverPhotoLinks {
  CoverPhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String self;
  String html;
  String download;
  String downloadLocation;

  factory CoverPhotoLinks.fromJson(Map<String, dynamic> json) =>
      CoverPhotoLinks(
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        twitterUsername:
            json["twitter_username"] == null ? null : json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName == null ? null : lastName,
        "twitter_username": twitterUsername == null ? null : twitterUsername,
        "portfolio_url": portfolioUrl,
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

class TopicModelLinks {
  TopicModelLinks({
    this.self,
    this.html,
    this.photos,
  });

  String self;
  String html;
  String photos;

  factory TopicModelLinks.fromJson(Map<String, dynamic> json) =>
      TopicModelLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
      };
}

class PreviewPhoto {
  PreviewPhoto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.blurHash,
    this.urls,
  });

  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String blurHash;
  Urls urls;

  factory PreviewPhoto.fromJson(Map<String, dynamic> json) => PreviewPhoto(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        blurHash: json["blur_hash"],
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "blur_hash": blurHash,
        "urls": urls.toJson(),
      };
}

enum Status { OPEN }

final statusValues = EnumValues({"open": Status.OPEN});

class TotalCurrentUserSubmissions {
  TotalCurrentUserSubmissions();

  factory TotalCurrentUserSubmissions.fromJson(Map<String, dynamic> json) =>
      TotalCurrentUserSubmissions();

  Map<String, dynamic> toJson() => {};
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
