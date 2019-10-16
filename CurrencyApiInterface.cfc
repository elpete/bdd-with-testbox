interface {

    /**
     * If the currency is not found, must throw a CurrencyNotFound exception
     *
     * @fromCurrency
     * @toCurrency
     */
    public numeric function getExchangeRate(
        required string fromCurrency,
        required string toCurrency
    );
}
