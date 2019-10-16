component extends="testbox.system.BaseSpec" labels="external" {

    function getApi() {
        return new ExchangeRatesApi();
    }

    function run() {
        describe( "Currency API Spec", () => {
            it( "can retrieve the exchange rate for two valid currencies", () => {
                var api = getApi();
                var actual = api.getExchangeRate( "EUR", "USD" );
                expect( actual ).toBeNumeric();
            } );

            it( "throws an exception when receiving an invalid toCurrency", () => {
                var api = getApi();
                expect( () => {
                    api.getExchangeRate( "EUR", "not-valid" );
                } ).toThrow( "CurrencyNotFound" );
            } );
        } );
    }

}
