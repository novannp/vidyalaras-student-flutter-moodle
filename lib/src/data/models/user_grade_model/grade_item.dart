class Gradeitem {
  int? id;
  String? itemname;
  String? itemtype;
  String? itemmodule;
  int? iteminstance;
  int? itemnumber;
  dynamic idnumber;
  int? categoryid;
  dynamic outcomeid;
  dynamic scaleid;
  dynamic locked;
  int? cmid;
  dynamic graderaw;
  dynamic gradedatesubmitted;
  dynamic gradedategraded;
  bool? gradehiddenbydate;
  bool? gradeneedsupdate;
  bool? gradeishidden;
  dynamic gradeislocked;
  dynamic gradeisoverridden;
  String? gradeformatted;
  int? grademin;
  int? grademax;
  String? rangeformatted;
  String? percentageformatted;
  String? feedback;
  int? feedbackformat;

  Gradeitem({
    this.id,
    this.itemname,
    this.itemtype,
    this.itemmodule,
    this.iteminstance,
    this.itemnumber,
    this.idnumber,
    this.categoryid,
    this.outcomeid,
    this.scaleid,
    this.locked,
    this.cmid,
    this.graderaw,
    this.gradedatesubmitted,
    this.gradedategraded,
    this.gradehiddenbydate,
    this.gradeneedsupdate,
    this.gradeishidden,
    this.gradeislocked,
    this.gradeisoverridden,
    this.gradeformatted,
    this.grademin,
    this.grademax,
    this.rangeformatted,
    this.percentageformatted,
    this.feedback,
    this.feedbackformat,
  });

  @override
  String toString() {
    return 'Gradeitem(id: $id, itemname: $itemname, itemtype: $itemtype, itemmodule: $itemmodule, iteminstance: $iteminstance, itemnumber: $itemnumber, idnumber: $idnumber, categoryid: $categoryid, outcomeid: $outcomeid, scaleid: $scaleid, locked: $locked, cmid: $cmid, graderaw: $graderaw, gradedatesubmitted: $gradedatesubmitted, gradedategraded: $gradedategraded, gradehiddenbydate: $gradehiddenbydate, gradeneedsupdate: $gradeneedsupdate, gradeishidden: $gradeishidden, gradeislocked: $gradeislocked, gradeisoverridden: $gradeisoverridden, gradeformatted: $gradeformatted, grademin: $grademin, grademax: $grademax, rangeformatted: $rangeformatted, percentageformatted: $percentageformatted, feedback: $feedback, feedbackformat: $feedbackformat)';
  }

  factory Gradeitem.fromJson(Map<String, dynamic> json) => Gradeitem(
        id: json['id'] as int?,
        itemname: json['itemname'] as String?,
        itemtype: json['itemtype'] as String?,
        itemmodule: json['itemmodule'] as String?,
        iteminstance: json['iteminstance'] as int?,
        itemnumber: json['itemnumber'] as int?,
        idnumber: json['idnumber'] as dynamic,
        categoryid: json['categoryid'] as int?,
        outcomeid: json['outcomeid'] as dynamic,
        scaleid: json['scaleid'] as dynamic,
        locked: json['locked'] as dynamic,
        cmid: json['cmid'] as int?,
        graderaw: json['graderaw'] as dynamic,
        gradedatesubmitted: json['gradedatesubmitted'] as dynamic,
        gradedategraded: json['gradedategraded'] as dynamic,
        gradehiddenbydate: json['gradehiddenbydate'] as bool?,
        gradeneedsupdate: json['gradeneedsupdate'] as bool?,
        gradeishidden: json['gradeishidden'] as bool?,
        gradeislocked: json['gradeislocked'] as dynamic,
        gradeisoverridden: json['gradeisoverridden'] as dynamic,
        gradeformatted: json['gradeformatted'] as String?,
        grademin: json['grademin'] as int?,
        grademax: json['grademax'] as int?,
        rangeformatted: json['rangeformatted'] as String?,
        percentageformatted: json['percentageformatted'] as String?,
        feedback: json['feedback'] as String?,
        feedbackformat: json['feedbackformat'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'itemname': itemname,
        'itemtype': itemtype,
        'itemmodule': itemmodule,
        'iteminstance': iteminstance,
        'itemnumber': itemnumber,
        'idnumber': idnumber,
        'categoryid': categoryid,
        'outcomeid': outcomeid,
        'scaleid': scaleid,
        'locked': locked,
        'cmid': cmid,
        'graderaw': graderaw,
        'gradedatesubmitted': gradedatesubmitted,
        'gradedategraded': gradedategraded,
        'gradehiddenbydate': gradehiddenbydate,
        'gradeneedsupdate': gradeneedsupdate,
        'gradeishidden': gradeishidden,
        'gradeislocked': gradeislocked,
        'gradeisoverridden': gradeisoverridden,
        'gradeformatted': gradeformatted,
        'grademin': grademin,
        'grademax': grademax,
        'rangeformatted': rangeformatted,
        'percentageformatted': percentageformatted,
        'feedback': feedback,
        'feedbackformat': feedbackformat,
      };
}
