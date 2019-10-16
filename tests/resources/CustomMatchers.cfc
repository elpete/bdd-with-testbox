component {

    function toBeFizz( expectation, args ) {
        expectation.message = "Expected to see `fizz`";
        return expectation.actual == "fizz";
    }

    function toBeBuzz( expectation, args ) {
        expectation.message = "Expected to see `buzz`";
        return expectation.actual == "buzz";
    }

}
