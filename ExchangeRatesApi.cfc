component implements="CurrencyApiInterface" {

    public numeric function getExchangeRate(
        required string fromCurrency,
        required string toCurrency
    ) {
        var result = "";
        cfhttp( url = "https://api.exchangerate.host/convert", result = "local.result" ) {
            cfhttpparam( type = "url", name = "from", value = arguments.fromCurrency );
            cfhttpparam( type = "url", name = "to", value = arguments.toCurrency );
        }
        if ( local.result.status_code != 200 ) {
            throw( type = "CurrencyNotFound" );
        }
        return deserializeJSON( local.result.filecontent ).rates[ arguments.toCurrency ];
    }

}
