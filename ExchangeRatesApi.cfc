component implements="CurrencyApiInterface" {

    public numeric function getExchangeRate(
        required string fromCurrency,
        required string toCurrency
    ) {
        var result = "";
        cfhttp( url = "https://api.exchangeratesapi.io/latest", result = "local.result" ) {
            cfhttpparam( type = "url", name = "base", value = arguments.fromCurrency );
            cfhttpparam( type = "url", name = "symbols", value = arguments.toCurrency );
        }
        if ( local.result.status_code != 200 ) {
            throw( type = "CurrencyNotFound" );
        }
        return deserializeJSON( local.result.filecontent ).rates[ arguments.toCurrency ];
    }

}
