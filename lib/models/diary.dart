enum EmojiType {
  happy,
  sad,
  tired,
  angry,
  none
}

extension EmojiTypeExtension on EmojiType {
  String get KOR {
    switch (this) {
      case EmojiType.happy: return "행복";
      case EmojiType.sad: return "슬픔";
      case EmojiType.tired: return "피곤";
      case EmojiType.angry: return "화남";
      default: return "";
    }
  }

  String get ENG {
    switch (this) {
      case EmojiType.happy: return "happy";
      case EmojiType.sad: return "sad";
      case EmojiType.tired: return "tired";
      case EmojiType.angry: return "angry";
      default: return "";
    }
  }
}

extension EmotialyStringExtension on String {
  EmojiType get EMOJITYPE {
    switch (this) {
      case "happy": return EmojiType.happy;
      case "sad": return EmojiType.sad;
      case "tired": return EmojiType.tired;
      case "angry": return EmojiType.angry;
      default: return EmojiType.none;
    }
  }
}

class Diary {
  String? _id;
  String? _title;
  EmojiType? _emoji;
  String? _message;
  DateTime? _date;


  String? get id => _id;
  String? get title => _title;
  EmojiType? get emoji => _emoji;
  String? get message => _message;
  DateTime? get date => _date;


  Diary({
    required String? id,
    required String? title,
    required EmojiType? emoji,
    required String? message,
    required DateTime? date,}){
    _id = id;
    _title = title;
    _emoji = emoji;
    _message = message;
    _date = date;
  }

  Diary.fromJson(dynamic json) {
    _id = json['_id'];
    _title = json['title'];
    _emoji = (json['emoji'] as String).EMOJITYPE;
    _message = json['message'];
    _date = DateTime.parse(json['created']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['title'] = _title;
    map['emoji'] = _emoji!.ENG;
    map['message'] = _message;
    map['created'] = date.toString();
    return map;
  }

}