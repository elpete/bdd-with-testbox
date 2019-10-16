component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "Password Validator", () => {
            it( "passes a valid password", function() {
                // arrange
                var validator = new PasswordValidator();
                var validPassword = "Password1234";
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
                var invalidPassword = "password1234";
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
                var invalidPassword = "Sh0rt";
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
                var invalidPassword = "PASSWORD1234";
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
                var invalidPassword = "Password";
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
        } );
    }

}
