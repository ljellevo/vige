package classes;





import classes.Step.StepStruct;

typedef GuideStruct = {
  var _id: String;
  var title: String;
  var desc: String;
  var steps: Array<StepStruct>;
}

class Guide {

  var _id: String;

  var title: String;
  var desc: String;
  var steps: Array<Step>;

  public function new(
    _id: String,
    title: String,
    desc: String,
    steps: Array<Step>
  ) {
    this._id = _id;
    this.title = title;
    this.desc = desc;
    this.steps = steps;
  }

  public function getId(): String {
    return _id;
  }

  public function getTitle(): String {
    return title;
  }

  public function getDesc(): String {
    return desc;
  }

  public function getSteps(): Array<Step> {
    return steps;
  }
}