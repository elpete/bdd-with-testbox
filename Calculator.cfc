component {
    function add( x, y ) {
        return x + y;
    }

    function subtract( x, y ) {
        return x - y;
    }

    function divide( x, y ) {
        if ( y == 0 ) {
            throw( type = "DivideByZeroException" );
        }
        return x / y;
    }

    function absoluteValue( x ) {
        return abs( x );
    }
}
