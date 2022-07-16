class Videos {
  final String _id, name, link, type, item, user;

  Videos(this._id, this.name, this.link, this.type, this.item, this.user);
}

class Courses {
  final String _id, name, item;
  Courses(this._id, this.name, this.item);
}
class Pyqs {
  final String _id, name, link,item,user;
  Pyqs(this._id, this.name, this.link,this.item,this.user);
}

class Pdfs {
  final String _id, name, item,link,user;
  Pdfs(this._id, this.name, this.item,this.link,this.user);
}
class Noti {
  final String _id, name, content,link;
  Noti(this._id, this.name, this.content,this.link);
}
class Syllabus {
  final String _id,course,link;
  Syllabus(this._id,this.course,this.link);
}

class Ads {
      String id, inter, video,banner,all;
    Ads(
        this.id,
        this.inter,
        this.video,this.banner,this.all);
}
