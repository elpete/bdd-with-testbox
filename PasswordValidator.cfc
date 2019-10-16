component {

    variables.checks = [
        "length",
        "uppercase",
        "lowercase",
        "number"
    ];

    function check( password ) {
        var errors = [];

        variables.checks.each( ( type ) => {
            invoke( this, "check#type#", {
                password = password,
                errors = errors
            } );
        } );

        return {
            valid: errors.isEmpty(),
            errors: errors
        };
    }

    function checkLength( password, errors ) {
        if ( arguments.password.len() < 8 ) {
            errors.append( "Passwords must be at least 8 characters long." );
        }
    }

    function checkUppercase( password, errors ) {
        if ( reFind( "[A-Z]", arguments.password ) <= 0 ) {
            errors.append( "Passwords must have at least 1 uppercase letter." );
        }
    }

    function checkLowercase( password, errors ) {
        if ( reFind( "[a-z]", arguments.password ) <= 0 ) {
            errors.append( "Passwords must have at least 1 lowercase letter." );
        }
    }

    function checkNumber( password, errors ) {
        if ( reFind( "[0-9]", arguments.password ) <= 0 ) {
            errors.append( "Passwords must have at least 1 number." );
        }
    }

}
