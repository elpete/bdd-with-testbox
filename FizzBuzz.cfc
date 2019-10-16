component {

    function init( converter = new FizzBuzzConverter() ) {
        variables.converter = arguments.converter;
        return this;
    }

    function forRange( start, end ) {
        var items = [];
        for ( var i = start; i <= end; i++ ) {
            items.append( converter.convert( i ) );
        }
        return items;
    }

}
