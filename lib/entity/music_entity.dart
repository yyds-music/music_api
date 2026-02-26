enum MusicSite {
  None,
  Mix,
  MyFreeMp3,
  Baidu,
  KuGou,
  KuWo,
  MiGu,
  Netease,
  QQ,
  AudioMack
}

enum MusicFormat { LQ, PQ, HQ, SQ, ZQ24 }

extension MusicSiteTitleZh on MusicSite {
  String get titleZh {
    switch (this) {
      case MusicSite.None:
        return "无";
      case MusicSite.Mix:
        return "聚合";
      case MusicSite.MyFreeMp3:
        return "MyFreeMp3";
      case MusicSite.Baidu:
        return "百度";
      case MusicSite.KuGou:
        return "酷狗";
      case MusicSite.KuWo:
        return "酷我";
      case MusicSite.MiGu:
        return "咪咕";
      case MusicSite.Netease:
        return "网易云";
      case MusicSite.QQ:
        return "QQ音乐";
      case MusicSite.AudioMack:
        return "AudioMack";
    }
  }
}

extension MusicFormatTitleZh on MusicFormat {
  String get titleZh {
    switch (this) {
      case MusicFormat.LQ:
        return "流畅";
      case MusicFormat.PQ:
        return "标准";
      case MusicFormat.HQ:
        return "高品";
      case MusicFormat.SQ:
        return "无损";
      case MusicFormat.ZQ24:
        return "母带24bit";
    }
  }
}

const allSite = [
  MusicSite.MyFreeMp3,
  MusicSite.Baidu,
  MusicSite.KuGou,
  MusicSite.KuWo,
  MusicSite.MiGu,
  MusicSite.Netease,
  MusicSite.QQ,
  MusicSite.AudioMack,
];

Map Resp({int? code = 200, String? msg = "操作成功", dynamic data}) {
  return {"code": code, "msg": msg, "data": data};
}

Map Song({
  required MusicSite site,
  required dynamic id,
  dynamic mid,
  String? contentId,
  String? mediaId,
  dynamic albumAudioId,
  required String? title,
  dynamic subTitle,
  List<Map>? artist = const [],
  Map? album,
  String? url,
  required String? pic,
  String? lyric,
}) {
  return {
    "site": site.name,
    "id": id,
    "mid": mid,
    "contentId": contentId,
    "mediaId": mediaId,
    "albumAudioId": albumAudioId,
    "title": title,
    "subTitle": subTitle,
    "artist": artist,
    "album": album,
    "url": url,
    "pic": pic,
    "lyric": lyric,
  };
}

Map Artist({required dynamic id, required String? name, String? pic}) {
  return {"id": id, "name": name, "pic": pic};
}

Map Url({required String? url, MusicFormat format = MusicFormat.HQ}) {
  return {"format": format.name, "url": url};
}

Map Album({
  required MusicSite site,
  required dynamic id,
  required String? title,
  required String? pic,
  String? subTitle,
  String? desc,
  dynamic songCount,
  List<Map>? artist = const [],
  List<Map>? songs = const [],
}) {
  return {
    "site": site.name,
    "id": id,
    "title": title,
    "pic": pic,
    "subTitle": subTitle,
    "desc": desc,
    "songCount": songCount,
    "songs": songs,
    "artist": artist,
  };
}

Map Banner({
  required MusicSite site,
  required String id,
  String? title,
  required String pic,
  String? type,
}) {
  return {
    "site": site.name,
    "id": id,
    "title": title,
    "pic": pic,
    "type": type,
  };
}

Map PlayList({
  required MusicSite site,
  required dynamic id,
  required String? title,
  required String pic,
  String? desc,
  dynamic songCount,
  List<Map>? songs = const [],
}) {
  return {
    "site": site.name,
    "id": id,
    "title": title,
    "pic": pic,
    "desc": desc,
    "songCount": songCount,
    "songs": songs,
  };
}
