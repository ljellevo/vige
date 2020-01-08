package classes;



typedef ArgumentStruct = {
    var name: String;
    var req: Bool;
}

class ArgumentDoc {
    var name: String;
    var req: Bool;

    public function new(
        name: String,
        req: Bool
    ){
       this.name = name;
       this.req = req; 
    }

    public function getName(): String {
        return name;
    }

    public function getReq(): Bool {
        return req;
    }
}

typedef ExampleStruct = {
    var desc: String;
    var link: String;
}

class ExampleDoc {
    var desc: String;
    var link: String;

    public function new(
        desc: String,
        link: String
    ){
        this.desc = desc;
        this.link = link;
    }

    public function getDesc(): String {
        return desc;
    }

    public function getLink(): String {
        return link;
    }
}

typedef WidgetStruct = {
    var name: String;
    var desc: String;
    var category: String;
    var arguments: Array<ArgumentStruct>;
    var returns: String;
    var example: Array<ExampleStruct>;
}

class WidgetDoc {
    var name: String;
    var desc: String;
    var category: String;
    var arguments: Array<ArgumentDoc>;
    var returns: String;
    var example: Array<ExampleDoc>;
    
    public function new(
        name: String,
        desc: String,
        category: String,
        arguments: Array<ArgumentDoc>,
        returns: String,
        example: Array<ExampleDoc>
    ){
        this.name = name;
        this.desc = desc;
        this.category = category;
        this.arguments = arguments;
        this.returns = returns;
        this.example = example;
    }

    public function getName(): String {
        return name;
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