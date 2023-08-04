class Lesson {
  int? id;
  int? course;
  int? coursemodule;
  String? name;
  String? intro;
  int? introformat;
  bool? practice;
  bool? modattempts;
  bool? usepassword;
  int? grade;
  bool? custom;
  bool? ongoing;
  int? usemaxgrade;
  int? maxanswers;
  int? maxattempts;
  bool? review;
  int? nextpagedefault;
  bool? feedback;
  int? minquestions;
  int? maxpages;
  int? timelimit;
  bool? retake;
  String? mediafile;
  int? mediaheight;
  int? mediawidth;
  int? mediaclose;
  bool? slideshow;
  int? width;
  int? height;
  String? bgcolor;
  bool? displayleft;
  int? displayleftif;
  bool? progressbar;
  bool? allowofflineattempts;
  List? introfiles;
  List? mediafiles;

  Lesson(
      {this.id,
        this.course,
        this.coursemodule,
        this.name,
        this.intro,
        this.introformat,
        this.practice,
        this.modattempts,
        this.usepassword,
        this.grade,
        this.custom,
        this.ongoing,
        this.usemaxgrade,
        this.maxanswers,
        this.maxattempts,
        this.review,
        this.nextpagedefault,
        this.feedback,
        this.minquestions,
        this.maxpages,
        this.timelimit,
        this.retake,
        this.mediafile,
        this.mediaheight,
        this.mediawidth,
        this.mediaclose,
        this.slideshow,
        this.width,
        this.height,
        this.bgcolor,
        this.displayleft,
        this.displayleftif,
        this.progressbar,
        this.allowofflineattempts,
        this.introfiles,
        this.mediafiles});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course = json['course'];
    coursemodule = json['coursemodule'];
    name = json['name'];
    intro = json['intro'];
    introformat = json['introformat'];
    practice = json['practice'];
    modattempts = json['modattempts'];
    usepassword = json['usepassword'];
    grade = json['grade'];
    custom = json['custom'];
    ongoing = json['ongoing'];
    usemaxgrade = json['usemaxgrade'];
    maxanswers = json['maxanswers'];
    maxattempts = json['maxattempts'];
    review = json['review'];
    nextpagedefault = json['nextpagedefault'];
    feedback = json['feedback'];
    minquestions = json['minquestions'];
    maxpages = json['maxpages'];
    timelimit = json['timelimit'];
    retake = json['retake'];
    mediafile = json['mediafile'];
    mediaheight = json['mediaheight'];
    mediawidth = json['mediawidth'];
    mediaclose = json['mediaclose'];
    slideshow = json['slideshow'];
    width = json['width'];
    height = json['height'];
    bgcolor = json['bgcolor'];
    displayleft = json['displayleft'];
    displayleftif = json['displayleftif'];
    progressbar = json['progressbar'];
    allowofflineattempts = json['allowofflineattempts'];
    if (json['introfiles'] != null) {
      introfiles = [];
      json['introfiles'].forEach((v) {
        introfiles!.add(v);
      });
    }
    if (json['mediafiles'] != null) {
      mediafiles = <Null>[];
      json['mediafiles'].forEach((v) {
        mediafiles!.add(v);
      });
    }
  }

}
