package classes;



typedef ArgumentStruct = {
    var name: String;
    var req: Bool;
    var type: String;
    var link: String;
    var note: String;
}

class ArgumentDoc {
    var name: String;
    var req: Bool;
    var type: String;
    var link: String;
    var note: String;

    public function new(
        name: String,
        req: Bool,
        type: String,
        link: String,
        note: String
    ){
       this.name = name;
       this.req = req; 
       this.type = type;
       this.link = link;
       this.note = note;
    }

    public function getName(): String {
        return name;
    }

    public function getReq(): Bool {
        return req;
    }

    public function getType(): String {
        return type;
    }

    public function getLink(): String {
        return link;
    }

    public function getNote(): String {
        return note;
    }
}

typedef ExampleStruct = {
    var desc: String;
    var code: String;
}

class ExampleDoc {
    var desc: String;
    var code: String;

    public function new(
        desc: String,
        code: String
    ){
        this.desc = desc;
        this.code = code;
    }

    public function getDesc(): String {
        return desc;
    }

    public function getCode(): String {
        return code;
    }
}

typedef WidgetStruct = {
    var name: String;
    var shortDesc: String;
    var desc: String;
    var category: String;
    var arguments: Array<ArgumentStruct>;
    var returns: String;
    var example: Array<ExampleStruct>;
}

class WidgetDoc {
    var name: String;
    var shortDesc: String;
    var desc: String;
    var category: String;
    var arguments: Array<ArgumentDoc>;
    var returns: String;
    var example: Array<ExampleDoc>;
    
    public function new(
        name: String,
        shortDesc: String,
        desc: String,
        category: String,
        arguments: Array<ArgumentDoc>,
        returns: String,
        example: Array<ExampleDoc>
    ){
        this.name = name;
        this.shortDesc = shortDesc;
        this.desc = desc;
        this.category = category;
        this.arguments = arguments;
        this.returns = returns;
        this.example = example;
    }

    public function getName(): String {
        return name;
    }

    public function getShortDesc(): String {
        return shortDesc;
    }

    public function getDesc(): String {
        return desc;
    }

    public function getCategory(): String {
        return category;
    }

    public function getArguments(): Array<ArgumentDoc>  {
        return arguments;
    }

    public function getReturns(): String {
        return returns;
    }

    public function getExample(): Array<ExampleDoc> {
        return example;
    }
}