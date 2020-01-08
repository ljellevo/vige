package classes;

typedef StepStruct = {
    var type: String;
    var format: String;
    var title: String;
    var content: String;
  }
  
  class Step {
    var type: String;
    var format: String;
    var title: String;
    var content: String;
  
    public function new(
      type: String,
      format: String,
      title: String,
      content: String
    ) {
      this.type = type;
      this.format = format;
      this.title = title;
      this.content = content;
    }
  
    public function getType(): String {
      return type;
    }
  
    public function getFormat(): String {
      return format;
    }
  
    public function getTitle(): String {
      return title;
    }
  
    public function getContent(): String {
      return content;
    }
  }