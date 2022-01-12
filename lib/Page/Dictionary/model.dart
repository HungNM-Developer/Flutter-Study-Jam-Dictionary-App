// To parse this JSON data, do
//
//     final dictModel = dictModelFromJson(jsonString);

import 'dart:convert';

List<DictModel> dictModelFromJson(String str) =>
    List<DictModel>.from(json.decode(str).map((x) => DictModel.fromJson(x)));

String dictModelToJson(List<DictModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DictModel {
  DictModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.origin,
    this.meanings,
  });

  String? word;
  String? phonetic;
  List<Phonetic>? phonetics;
  String? origin;
  List<Meaning>? meanings;

  factory DictModel.fromJson(Map<String, dynamic> json) => DictModel(
        word: json["word"],
        phonetic: json["phonetic"],
        phonetics: List<Phonetic>.from(
            json["phonetics"].map((x) => Phonetic.fromJson(x))),
        origin: json["origin"],
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetic": phonetic,
        "phonetics": List<dynamic>.from(phonetics!.map((x) => x.toJson())),
        "origin": origin,
        "meanings": List<dynamic>.from(meanings!.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    this.partOfSpeech,
    this.definitions,
  });

  String? partOfSpeech;
  List<Definition>? definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions!.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    this.definition,
    this.example,
    this.synonyms,
    this.antonyms,
  });

  String? definition;
  String? example;
  List<dynamic>? synonyms;
  List<dynamic>? antonyms;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        example: json["example"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": List<dynamic>.from(synonyms!.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms!.map((x) => x)),
      };
}

class Phonetic {
  Phonetic({
    this.text,
    this.audio,
  });

  String? text;
  String? audio;

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        text: json["text"],
        audio: json["audio"] == null ? null : json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio == null ? null : audio,
      };
}
