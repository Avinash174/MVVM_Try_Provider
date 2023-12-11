class BookModel {
  int? page;
  List<ReadingLogEntries>? readingLogEntries;

  BookModel({this.page, this.readingLogEntries});

  BookModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['reading_log_entries'] != null) {
      readingLogEntries = <ReadingLogEntries>[];
      json['reading_log_entries'].forEach((v) {
        readingLogEntries!.add(new ReadingLogEntries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.readingLogEntries != null) {
      data['reading_log_entries'] =
          this.readingLogEntries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReadingLogEntries {
  Work? work;
  String? loggedEdition;
  String? loggedDate;

  ReadingLogEntries({this.work, this.loggedEdition, this.loggedDate});

  ReadingLogEntries.fromJson(Map<String, dynamic> json) {
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
    loggedEdition = json['logged_edition'];
    loggedDate = json['logged_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.work != null) {
      data['work'] = this.work!.toJson();
    }
    data['logged_edition'] = this.loggedEdition;
    data['logged_date'] = this.loggedDate;
    return data;
  }
}

class Work {
  String? title;
  String? key;
  List<String>? authorKeys;
  List<String>? authorNames;
  int? firstPublishYear;
  String? lendingEditionS;
  List<String>? editionKey;
  int? coverId;
  String? coverEditionKey;

  Work(
      {this.title,
      this.key,
      this.authorKeys,
      this.authorNames,
      this.firstPublishYear,
      this.lendingEditionS,
      this.editionKey,
      this.coverId,
      this.coverEditionKey});

  Work.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    key = json['key'];
    authorKeys = json['author_keys'].cast<String>();
    authorNames = json['author_names'].cast<String>();
    firstPublishYear = json['first_publish_year'];
    lendingEditionS = json['lending_edition_s'];
    editionKey = json['edition_key'].cast<String>();
    coverId = json['cover_id'];
    coverEditionKey = json['cover_edition_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['key'] = this.key;
    data['author_keys'] = this.authorKeys;
    data['author_names'] = this.authorNames;
    data['first_publish_year'] = this.firstPublishYear;
    data['lending_edition_s'] = this.lendingEditionS;
    data['edition_key'] = this.editionKey;
    data['cover_id'] = this.coverId;
    data['cover_edition_key'] = this.coverEditionKey;
    return data;
  }
}
