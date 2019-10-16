component extends="testbox.system.BaseSpec" {

    function beforeAll() {
        addMatchers( {
            "toBePositive" = ( expectation, args ) => {
                var shouldBe = expectation.isNot ? "not to be" : "to be"
                expectation.message = "Expected #expectation.actual# #shouldBe# a positive number";
                var passes = expectation.isNot ? expectation.actual < 0 : expectation.actual > 0;
                if ( ! passes ) {
                    debug( expectation.actual );
                }
                return passes;
            }
        } );
    }

    function run() {
        describe( "calculator", () => {
            it( "can add two numbers", () => {
                var calculator = new Calculator();
                expect( calculator.add( 1, 1 ) ).toBe( 2 );
            } );

            it( "throws an exception when dividing by zero", () => {
                var calculator = new Calculator();
                expect( () => {
                    calculator.divide( 4, 0 );
                } ).toThrow( "DivideByZeroException" );
            }, "exceptions" );

            it( "can return the absolute value of a number", function() {
                var calculator = new Calculator();
                expect( calculator.absoluteValue( -3 ) ).toBePositive();
            } );
        } );
    }
}
