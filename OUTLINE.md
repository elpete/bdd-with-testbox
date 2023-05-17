# Exercises

## Step 0

Setup repo with Test Runner

(All commands ran in CommandBox)
1. `mkdir testbox-itb2023 --cd`
2. `package init testbox-itb2023`
3. `install testbox-cli`
4. `install testbox`
5. `testbox generate harness`
6. Add `/root` mapping to `tests/Application.cfc`
```cfc
this.mappings[ "/root" ] = expandPath( "/" );
```
7. `server start`
8. Navigate to `/tests/runner.cfm`
9. Also try `testbox run` from CommandBox
10. (BONUS) Try `testbox watch` from CommandBox, then edit the sample `BDDTest.cfc`.

## Step 1 (5 minutes)
### Exercise — Create an XUnit Calculator Spec
Your calculator should have specs for the following:
1. Add two numbers
2. Subtract two numbers
3. Multiply two numbers
4. Divide two numbers

### Solution
```
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

    function test_it_can_multiply_two_numbers() {
        var calculator = new Calculator();
        $assert.isEqual( 12, calculator.multiply( 3, 4 ) );
        $assert.isEqual( 0, calculator.multiply( 9, 0 ) );
    }

    function test_it_can_divide_two_numbers() {
        var calculator = new Calculator();
        $assert.isEqual( 2, calculator.divide( 4, 2 ) );
        $assert.isEqual( 2.5, calculator.divide( 5, 2 ) );
    }

}
```

## Step 2 (5 minutes)
### Exercise — Create a BDD Calculator Spec
Your calculator should have specs for the following:
1. Throw an exception when dividing by zero.
2. Calculate the absolute value of a number.
3. It can raise a number to the power of another number.
4. Check equality of two numbers and return a boolean.

### Solution
```
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
```

## Step 3
### Exercise — FizzBuzz (10 minutes)
Fizz buzz is an exercise teach them about division. Counting incrementally, replace any number divisible by three with the word "fizz", any number divisible by five with the word "buzz", and any number divisible by both 3 and 5 with the word "fizzbuzz".

In this exercise, and for future exercises, we are going to use the TDD workflow of "red, green, refactor".

Write a spec that:
1. Can tell if a number is fizz. Do so using a custom matcher.
2. Can tell if a number is buzz. Do so using a custom matcher.
3. Can tell if a number is fizzbuzz. Do so using a custom matcher.
4. Can tell if a number is normal. Do so using a custom matcher.
5. Takes a lower bound and an upper bound for a range and returns an array in the fizzbuzz syntax.

### Solution
```cfc
component extends="testbox.system.BaseSpec" {

    function beforeAll() {
        addMatchers( "tests.resources.FizzBuzzMatchers" );
    }

    function run() {
        describe( "fizz buzz", () => {
            it( "can detect if a number is fizz", function() {
                var fizzbuzz = new FizzBuzzConverter();
                expect( fizzbuzz.convert( 3 ) ).toBeFizz();
                expect( fizzbuzz.convert( 4 ) ).notToBeFizz();
                expect( fizzbuzz.convert( 15 ) ).notToBeFizz();
            } );

            it( "can detect if a number is buzz", function() {
                var fizzbuzz = new FizzBuzzConverter();
                expect( fizzbuzz.convert( 5 ) ).toBeBuzz();
                expect( fizzbuzz.convert( 6 ) ).notToBeBuzz();
                expect( fizzbuzz.convert( 15 ) ).notToBeBuzz();
            } );

            it( "can detect if a number is fizzbuzz", function() {
                var fizzbuzz = new FizzBuzzConverter();
                expect( fizzbuzz.convert( 5 ) ).notToBeFizzBuzz();
                expect( fizzbuzz.convert( 6 ) ).notToBeFizzBuzz();
                expect( fizzbuzz.convert( 15 ) ).toBeFizzBuzz();
            } );

            it( "can detect if a number is normal", function() {
                var fizzbuzz = new FizzBuzzConverter();
                expect( fizzbuzz.convert( 2 ) ).toBeNormal();
                expect( fizzbuzz.convert( 3 ) ).notToBeNormal();
                expect( fizzbuzz.convert( 5 ) ).notToBeNormal();
                expect( fizzbuzz.convert( 15 ) ).notToBeNormal();
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
```
```cfc
// tests.resources.FizzBuzzMatchers (resources is a great directory for testing files that aren't specs)
component {

    function toBeFizz( expectation, args ) {
        expectation.message = expectation.isNot ? "Expected not to see `fizz`." : "Expected to see `fizz`";
        return expectation.isNot ? expectation.actual != "fizz" : expectation.actual == "fizz";
    }

    function toBeBuzz( expectation, args ) {
        expectation.message = expectation.isNot ? "Expected not to see `buzz`." : "Expected to see `buzz`";
        return expectation.isNot ? expectation.actual != "buzz" : expectation.actual == "buzz";
    }

    function toBeFizzBuzz( expectation, args ) {
        expectation.message = expectation.isNot ? "Expected not to see `fizzbuzz`." : "Expected to see `fizzbuzz`";
        return expectation.isNot ? expectation.actual != "fizzbuzz" : expectation.actual == "fizzbuzz";
    }

}
```

## Step 4
### Exercise - Password Validator
Create a password validator component. It should `check` passwords against internally defined rules.
The rules are:
1. There must be at least eight (8) characters.
2. There must be at least one uppercase letter.
3. There must be at least one lowercase letter.
4. There must be at least one number.
5. There must be at least one special character.

### Solution
```cfc
component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "Password Validator", () => {
            it( "passes a valid password", function() {
                // arrange
                var validator = new PasswordValidator();
                var validPassword = "Password1234$";
                // act
                var actual = validator.check( validPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeTrue( "Valid password should be valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toBeEmpty( "No errors should be returned" );
            } );

            it( "fails if there is no uppercase letter", function() {
                // arrange
                var validator = new PasswordValidator();
                var invalidPassword = "password1234$";
                // act
                var actual = validator.check( invalidPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeFalse( "The invalid password should be not valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toHaveLength( 1 );
                expect( actual.errors[ 1 ] ).toBe( "Passwords must have at least 1 uppercase letter." );
            } );

            it( "fails if the password is less than eight characters", function() {
                // arrange
                var validator = new PasswordValidator();
                var invalidPassword = "Sh0rt$";
                // act
                var actual = validator.check( invalidPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeFalse( "The invalid password should be not valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toHaveLength( 1 );
                expect( actual.errors[ 1 ] ).toBe( "Passwords must be at least 8 characters long." );
            } );

            it( "fails if the password does not have a lowercase character", function() {
                // arrange
                var validator = new PasswordValidator();
                var invalidPassword = "PASSWORD1234$";
                // act
                var actual = validator.check( invalidPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeFalse( "The invalid password should be not valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toHaveLength( 1 );
                expect( actual.errors[ 1 ] ).toBe( "Passwords must have at least 1 lowercase letter." );
            } );

            it( "fails if the password does not have a number character", function() {
                // arrange
                var validator = new PasswordValidator();
                var invalidPassword = "Password$";
                // act
                var actual = validator.check( invalidPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeFalse( "The invalid password should be not valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toHaveLength( 1 );
                expect( actual.errors[ 1 ] ).toBe( "Passwords must have at least 1 number." );
            } );

            it( "fails if the password does not have a special character", function() {
                var validator = new PasswordValidator();
                var invalidPassword = "Password1";
                // act
                var actual = validator.check( invalidPassword );
                // assert
                expect( actual ).toBeStruct();
                expect( actual ).toHaveKey( "valid" );
                expect( actual.valid ).toBeFalse( "The invalid password should be not valid" );
                expect( actual ).toHaveKey( "errors" );
                expect( actual.errors ).toBeArray();
                expect( actual.errors ).toHaveLength( 1 );
                expect( actual.errors[ 1 ] ).toBe( "Passwords must have at least 1 special character." );
            } );
        } );
    }

}
```

## Step 5
### Exercise - BoxJsonParser (Showing mocking) - Arrange, Act, Assert
Write a BoxJsonParser that has `getDevDependencies` and `getVersion` methods.
It should read those values from a `box.json` file.
Your test should not read from the file system.  It should instead use mocks.
If the file is not a JSON file, then a custom exception should be thrown.

### Solution
```cfc
component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "box.json parser - unit", () => {
            it( "can return the version in the box.json file", function() {
                // arrange
                var boxJSONParser = prepareMock( new BoxJsonParser( "./some/box.json" ) );
                boxJSONParser.$( "loadFile" ).$results( '{"version":"1.4.2"}' );
                // act
                var actual = boxJSONParser.getVersion();
                // assert
                expect( actual ).toBe( "1.4.2" );
            } );

            it( "can return the devDependencies in the box.json file", function() {
                // arrange
                var boxJSONParser = prepareMock( new BoxJsonParser( "./some/box.json" ) );
                boxJSONParser.$( "loadFile" ).$results( '{"devDependencies":{"testbox":"^3.1.0"}}' );
                // act
                var actual = boxJSONParser.getDevDependencies();
                // assert
                expect( actual ).toBe( {
                    "testbox": "^3.1.0"
                } );
            } );

            it( "throws an InvalidBoxJson exception if the file is not JSON", function() {
                var boxJSONParser = prepareMock( new BoxJsonParser( "./some/box.json" ) );
                boxJSONParser.$( "loadFile" ).$results( "not-json" );
                expect( () => {
                    boxJSONParser.getVersion();
                 } ).toThrow( "InvalidBoxJson" );
            } );
        } );
    }

}
```

## Step 6
### Exercise - BoxJsonParser (Not mocking - integration)
Write a BoxJsonParser that has `getDevDependencies` and `getVersion` methods.
It should read those values from a `box.json` file.
Your test should read from a file on the filesystem.
If the file is not a JSON file, then a custom exception should be thrown.

### Solution
```
component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "box.json parser - integration", () => {
            it( "can return the version in the box.json file", function() {
                // arrange
                var boxJSONParser = new BoxJsonParser( "/tests/resources/sample.box.json" );
                // act
                var actual = boxJSONParser.getVersion();
                // assert
                expect( actual ).toBe( "2.5.1" );
            } );

            it( "can return the devDependencies in the box.json file", function() {
                // arrange
                var boxJSONParser = new BoxJsonParser( "/tests/resources/sample.box.json" );
                // act
                var actual = boxJSONParser.getDevDependencies();
                // assert
                expect( actual ).toBe( {
                    "testbox": "^3.1.0"
                } );
            } );

            it( "throws an InvalidBoxJson exception if the file is not JSON", function() {
                var boxJSONParser = new BoxJsonParser( "/tests/resources/not-json.box.json" );
                expect( () => {
                    boxJSONParser.getVersion();
                 } ).toThrow( "InvalidBoxJson" );
            } );
        } );
    }

}
```

## Step 7
### Exercise - CurrencyConverterSpec (Showing mocking)
Write a CurrencyConverter that `convert`s between two different currencies.
The CurrencyConverter should accept an API object that it calls a `getExchangeRate` method on passing the two currencies.
Your test should not hit the API.  It should instead use mocks.

### Solution
```
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
```

## Step 8
### Exercise - ExchangeRates (Not mocking - integration)
Write an ExchangeRatesApiSpec that has a `getExchangeRate` method.
This can be used in your `CurrencyConverter`.
Your test should hit the API.
The API URL is: `https://api.exchangerate.host/latest?base=USEDASdDA&symbols=EUR`.
It accepts `base` (from) and `symbols` (to) parameters which are the currency codes.
BONUS: Add a label to the spec and to our default test runner to exclude it by default.

### Solution
```
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
        } );
    }

}
```

## Step 9
### Exercise - Get started with ColdBox Testing
1. Create an app using `coldbox create app`.
2. Start the server and see the tests running in the browser.
Create an endpoint for our CurrencyConverter from earlier.
Make an integration test for it at `POST /convert`.
The data returned should be JSON.
Validate the `from` and `to` keys are present or return an appropriate status code (like 412 or 422)

### Solution
**Show the refactorability of integration tests**

## BONUS: Step 10
Show a log in integration test from query execute to Quick

## BONUS: Step 11
cbPlaywright or Cypress

## BONUS: Step 12
GitLab CI and GitHub Actions

