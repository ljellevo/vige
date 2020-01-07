import lib.components.Button;

class HomeButton extends Button {
    override public function render():js.html.ButtonElement {
        var button = new Button({
            child: child, 
            onClick: onClick,
    
            color: color,
            border: border,
            padding: padding,
            margin: margin,
            size: size 
        });

        var castButton = button.render();

        /*
        castButton.style.border = "none";

        castButton.style.padding = "8px 22px";
        castButton.style.textAlign = "center";
        castButton.style.textDecoration = "none";
        castButton.style.display = "inline-block";
        castButton.style.fontSize = "16px";
        castButton.style.borderRadius = "12px";
        
        castButton.onmouseenter = function (e) {
            castButton.style.borderRadius = "16px";
        }
        castButton.onmouseleave = function (e) {
            castButton.style.borderRadius = "12px";
        }
        */
        return castButton;
    }
}