component extends="testbox.system.BaseSpec" {

    function beforeAll() {
        addMatchers( "tests.resources.CustomMatchers" );
    }

    function run() {
        describe( "fizz buzz", () => {
            it( "does something", function() {
                var fizzbuzz = new FizzBuzzConverter();
                expect( fizzbuzz.convert( 3 ) ).toBeFizz()
            } );

            it( "can convert a range to fizzbuzz syntax", function() {
                var fizzbuzz = new FizzBuzz();
                var actual = fizzbuzz.forRange( 9, 16 );
                expect( actual ).toBe(
                    [ "fizz", "buzz", 11, "fizz", 13, 14, "fizzbuzz", 16 ]
                );
            } );
        } );
    }

}
