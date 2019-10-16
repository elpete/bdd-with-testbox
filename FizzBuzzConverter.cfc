component {
    function convert( num ) {
        if ( arguments.num % 5 == 0 && arguments.num % 3 == 0 ) {
            return "fizzbuzz";
        } else if ( arguments.num % 5 == 0 ) {
            return "buzz";
        } else if ( arguments.num % 3 == 0 ) {
            return "fizz";
        } else {
            return arguments.num
        }
    }
}
