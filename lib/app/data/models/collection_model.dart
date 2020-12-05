// To parse this JSON data, do
//
//     final collectionModel = collectionModelFromJson(jsonString);

import 'dart:convert';

List<CollectionModel> collectionModelFromJson(String str) =>
    List<CollectionModel>.from(
        json.decode(str).map((x) => CollectionModel.fromJson(x)));

String collectionModelToJson(List<CollectionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CollectionModel {
  CollectionModel({
    this.id,
    this.title,
    this.description,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.curated,
    this.featured,
    this.totalPhotos,
    this.private,
    this.shareKey,
    this.tags,
    this.links,
    this.user,
    this.coverPhoto,
    this.previewPhotos,
  });

  String id;
  String title;
  String description;
  DateTime publishedAt;
  DateTime lastCollectedAt;
  DateTime updatedAt;
  bool curated;
  bool featured;
  int totalPhotos;
  bool private;
  String shareKey;
  List<Tag> tags;
  CollectionModelLinks links;
  User user;
  CoverPhoto coverPhoto;
  List<PreviewPhoto> previewPhotos;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        id: json["id"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        publishedAt: DateTime.parse(json["published_at"]),
        lastCollectedAt: DateTime.parse(json["last_collected_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        curated: json["curated"],
        featured: json["featured"],
        totalPhotos: json["total_photos"],
        private: json["private"],
        shareKey: json["share_key"] == null ? null : json["share_key"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        links: CollectionModelLinks.fromJson(json["links"]),
        user: User.fromJson(json["user"]),
        coverPhoto: CoverPhoto.fromJson(json["cover_photo"]),
        previewPhotos: List<PreviewPhoto>.from(
            json["preview_photos"].map((x) => PreviewPhoto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description == null ? null : description,
        "published_at": publishedAt.toIso8601String(),
        "last_collected_at": lastCollectedAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "curated": curated,
        "featured": featured,
        "total_photos": totalPhotos,
        "private": private,
        "share_key": shareKey == null ? null : shareKey,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "links": links.toJson(),
        "user": user.toJson(),
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
        blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
        description: json["description"] == null ? null : json["description"],
        altDescription:
            json["alt_description"] == null ? null : json["alt_description"],
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
        "blur_hash": blurHash == null ? null : blurHash,
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

class CollectionModelLinks {
  CollectionModelLinks({
    this.self,
    this.html,
    this.photos,
    this.related,
  });

  String self;
  String html;
  String photos;
  String related;

  factory CollectionModelLinks.fromJson(Map<String, dynamic> json) =>
      CollectionModelLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        related: json["related"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "related": related,
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
        subcategory: json["subcategory"] == null
            ? null
            : Category.fromJson(json["subcategory"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
        "category": category.toJson(),
        "subcategory": subcategory == null ? null : subcategory.toJson(),
      };
}

class Category {
  Category({
    this.slug,
    this.prettySlug,
  });

  String slug;
  String prettySlug;

  factory Category.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Category(
      slug: json["slug"],
      prettySlug: json["pretty_slug"],
    );
  }
  Map<String, dynamic> toJson() => {
        "slug": slug,
        "pretty_slug": prettySlug,
      };
}

enum Type { LANDING_PAGE, SEARCH }

final typeValues =
    EnumValues({"landing_page": Type.LANDING_PAGE, "search": Type.SEARCH});

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
