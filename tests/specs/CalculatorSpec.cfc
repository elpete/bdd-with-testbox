component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "calculator", () => {
            it( "throws an exception when dividing by zero", function() {
                var calculator = new Calculator();
                expect( () => {
                    calculator.divide( 4, 0 );
                } ).toThrow( "DivideByZeroException" );
            }, "exceptions" );

            it( "can return the absolute value of a number", function() {
                var calculator = new Calculator();
                expect( calculator.absoluteValue( -3 ) ).toBe( 3 );
            } );

            it( "can raise a number to the power of another number", function() {
                var calculator = new Calculator();
                expect( calculator.exponent( 2, 3 ) ).toBe( 8 );
            } );

            it( "can check the equality of two numbers and return a boolean", function() {
                var calculator = new Calculator();
                expect( calculator.isEqual( 2, 3 ) ).toBeFalse();
                expect( calculator.isEqual( 4, 4 ) ).toBeTrue();
            } );
        } );
    }
}
