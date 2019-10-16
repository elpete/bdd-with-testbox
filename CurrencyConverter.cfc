component accessors="true" {

    property name="currencyApi" inject;

    public numeric function convert(
        required numeric amount,
        required string fromCurrency,
        required string toCurrency
    ) {
        return amount * currencyApi.getExchangeRate(
           arguments.fromCurrency,
           arguments.toCurrency
        );
    }

}
