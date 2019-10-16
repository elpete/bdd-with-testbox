component extends="testbox.system.BaseSpec" {

    function test_it_can_add_two_numbers() {
        var calculator = new Calculator();
        $assert.isEqual( 2, calculator.add( 1, 1 ) );
        $assert.isEqual( 3, calculator.add( 1, 2 ) );
    }

    function test_it_can_subtract_two_numbers() {
        var calculator = new Calculator();
        $assert.isEqual( 1, calculator.subtract( 2, 1 ) );
        $assert.isEqual( 3, calculator.subtract( 4, 1 ) );
    }

    function test_it_can_divide_two_numbers() {
        var calculator = new Calculator();
        $assert.isEqual( 2, calculator.divide( 4, 2 ) );
        $assert.isEqual( 2.5, calculator.divide( 5, 2 ) );
    }

    function test_it_throws_when_dividing_by_zero() label="exceptions" {
        var calculator = new Calculator();
        $assert.throws( () => {
            calculator.divide( 4, 0 )
        }, "DivideByZeroException" );
    }

}
