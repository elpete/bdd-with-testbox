component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "currency converter", () => {
            it( "can convert between EUR and USD", () => {
                // arrange
                var exchangeRate = 1.11;
                var baseAmount = 10;
                var convertedAmount = baseAmount * exchangeRate;
                var currencyApiMock = createStub()
                    .$( "getExchangeRate" )
                    .$args( "EUR", "USD" )
                    .$results( exchangeRate );
                var converter = new CurrencyConverter();
                converter.setCurrencyApi( currencyApiMock );
                // act
                var actual = converter.convert( baseAmount, "EUR", "USD" );
                // assert
                expect( actual ).toBe( convertedAmount );
            } );
        } );
    }

}
