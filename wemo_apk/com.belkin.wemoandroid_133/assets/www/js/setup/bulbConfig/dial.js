var Plot = function ( stage ) {
    this.setDimensions = function( x, y ) {
        this.elm.style.width = x + 'px';
        this.elm.style.height = y + 'px';
        this.width = x;
        this.height = y;
    };
    this.position = function( x, y ) {
        var xoffset = arguments[2] ? 0 : this.width / 2;
        var yoffset = arguments[2] ? 0 : this.height / 2;
        this.elm.style.left = (x - xoffset) + 'px';
        this.elm.style.top = (y - yoffset) + 'px';
        this.x = x;
        this.y = y;
    };
    this.setBackground = function( col ) {
        this.elm.style.background = col;
    };
    this.kill = function() {
        stage.removeChild( this.elm );
    };
    this.rotate = function( str ) {
        this.elm.style.webkitTransform = this.elm.style.MozTransform =
            this.elm.style.OTransform = this.elm.style.transform =
                'rotate(' + str + ')';
    };
    this.content = function( content ) {
        this.elm.innerHTML = content;
    };
    this.round = function( round ) {
        this.elm.style.borderRadius = round ? '50%/50%' : '';
    };
    this.hide = function() {
        this.elm.style.display = "none";
    };
    this.elm = document.createElement( 'div' );
    this.elm.style.position = 'absolute';

    stage.appendChild( this.elm );
};
