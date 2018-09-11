class Chapter {
  final String chapter;
  final String link;
  final List<Pages> pages;
  final String download;

  Chapter({this.chapter, this.link, this.pages, this.download});

  Chapter.fromMap(Map<String, dynamic> json)
      : chapter = json['chapter'],
        link = json['link'],
        download = json['download'],
        pages = Pages.map(json);
}

class Pages {
  final int id;
  final String chapterId;
  final String url;
  final String thumbUrl;

  Pages({this.id, this.chapterId, this.url, this.thumbUrl});

  Pages.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        chapterId = json['chapter_id'],
        thumbUrl = json['thumb_url'],
        url = json['url'];


  static List<Pages> map(Map<String, dynamic> json) {
    final List<dynamic> pages = json['pages'];
    final List<Pages> pageList = pages.map((m) => Pages.fromMap(m)).toList();
    return pageList;
  }
}
