package classes;

typedef CategoryStruct = {
  var title: String;
  var desc: String;
}

class Category {

    var title: String;
    var desc: String;

    public function new(
        title: String,
        desc: String
    ) {
        this.title = title;
        this.desc = desc;
    }

    public function getTitle(): String {
        return title;
    }

    public function getDesc(): String {
        return desc;
    }
}