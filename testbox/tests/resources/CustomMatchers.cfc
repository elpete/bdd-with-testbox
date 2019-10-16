component {

    function toBeFizz( expectation, args ) {
        expectation.message = "Expected to see `fizz`";
        return expectation.actual % 3 == 0;
    }

    function toBeBuzz( expectation, args ) {
        expectation.message = "Expected to see `buzz`";
        return expectation.actual % 5 == 0;
    }

}
