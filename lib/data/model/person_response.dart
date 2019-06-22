import 'dart:convert';

PersonResponse personResponseFromJson(String str) => PersonResponse.fromJson(json.decode(str));

String personResponseToJson(PersonResponse data) => json.encode(data.toJson());

class PersonResponse {
    List<Result> results;
    Info info;

    PersonResponse({
        this.results,
        this.info,
    });

    List<Result> get response => this.results;

    factory PersonResponse.fromJson(Map<String, dynamic> json) => new PersonResponse(
        results: new List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "results": new List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
    };
}

class Info {
    String seed;
    int results;
    int page;
    String version;

    Info({
        this.seed,
        this.results,
        this.page,
        this.version,
    });

    factory Info.fromJson(Map<String, dynamic> json) => new Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class Result {
    Name name;
    Location location;
    String email;
    Dob dob;
    String phone;
    String cell;
    Picture picture;

    Result({
        this.name,
        this.location,
        this.email,
        this.dob,
        this.phone,
        this.cell,
        this.picture,
    });

    factory Result.fromJson(Map<String, dynamic> json) => new Result(
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        dob: Dob.fromJson(json["dob"]),
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "dob": dob.toJson(),
        "phone": phone,
        "cell": cell,
        "picture": picture.toJson(),
    };
}

class Dob {
    DateTime date;
    int age;

    Dob({
        this.date,
        this.age,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => new Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
    };
}

class Location {
    String street;
    String city;
    String state;
    dynamic postcode;
    Coordinates coordinates;
    Timezone timezone;

    Location({
        this.street,
        this.city,
        this.state,
        this.postcode,
        this.coordinates,
        this.timezone,
    });

    factory Location.fromJson(Map<String, dynamic> json) => new Location(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
    };
}

class Coordinates {
    String latitude;
    String longitude;

    Coordinates({
        this.latitude,
        this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => new Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Timezone {
    String offset;
    String description;

    Timezone({
        this.offset,
        this.description,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => new Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
    };
}

class Name {
    String title;
    String first;
    String last;

    Name({
        this.title,
        this.first,
        this.last,
    });

    factory Name.fromJson(Map<String, dynamic> json) => new Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    String large;
    String medium;
    String thumbnail;

    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    factory Picture.fromJson(Map<String, dynamic> json) => new Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
