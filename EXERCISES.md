# Exercises

## Step 0

Setup repo with Test Runner

(All commands ran in CommandBox)
1. `mkdir testbox-itb2023 --cd`
2. `package init testbox-itb2023`
3. `install testbox-cli`
4. `install testbox`
5. `testbox generate harness`
6. `server start`
7. Navigate to `/tests/runner.cfm`
8. Also try `testbox run` from CommandBox
9. (BONUS) Try `testbox watch` from CommandBox, then edit the sample `BDDTest.cfc`.

## Step 1 (5 minutes)
### Exercise — Create an XUnit Calculator Spec
Your calculator should have specs for the following:
1. Add two numbers
2. Subtract two numbers
3. Multiply two numbers
4. Divide two numbers

## Step 2 (5 minutes)
### Exercise — Create a BDD Calculator Spec
Your calculator should have specs for the following:
1. Throw an exception when dividing by zero.
2. Calculate the absolute value of a number.
3. It can raise a number to the power of another number.
4. Check equality of two numbers and return a boolean.

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

## Step 4
### Exercise - Password Validator
Create a password validator component. It should `check` passwords against internally defined rules.
The rules are:
1. There must be at least eight (8) characters.
2. There must be at least one uppercase letter.
3. There must be at least one lowercase letter.
4. There must be at least one number.
5. There must be at least one special character.

## Step 5
### Exercise - BoxJsonParser (Showing mocking) - Arrange, Act, Assert
Write a BoxJsonParser that has `getDevDependencies` and `getVersion` methods.
It should read those values from a `box.json` file.
Your test should not read from the file system.  It should instead use mocks.
If the file is not a JSON file, then a custom exception should be thrown.

## Step 6
### Exercise - BoxJsonParser (Not mocking - integration)
Write a BoxJsonParser that has `getDevDependencies` and `getVersion` methods.
It should read those values from a `box.json` file.
Your test should read from a file on the filesystem.
If the file is not a JSON file, then a custom exception should be thrown.

## Step 7
### Exercise - CurrencyConverterSpec (Showing mocking)
Write a CurrencyConverter that `convert`s between two different currencies.
The CurrencyConverter should accept an API object that it calls a `getExchangeRate` method on passing the two currencies.
Your test should not hit the API.  It should instead use mocks.

## Step 8
### Exercise - ExchangeRates (Not mocking - integration)
Write an ExchangeRatesApiSpec that has a `getExchangeRate` method.
This can be used in your `CurrencyConverter`.
Your test should hit the API.
The API URL is: `https://api.exchangerate.host/latest?base=USEDASdDA&symbols=EUR`.
It accepts `base` (from) and `symbols` (to) parameters which are the currency codes.
BONUS: Add a label to the spec and to our default test runner to exclude it by default.

## Step 9
### Exercise - Get started with ColdBox Testing
1. Create an app using `coldbox create app`.
2. Start the server and see the tests running in the browser.
Create an endpoint for our CurrencyConverter from earlier.
Make an integration test for it at `POST /convert`.
The data returned should be JSON.
Validate the `from` and `to` keys are present or return an appropriate status code (like 412 or 422)s
