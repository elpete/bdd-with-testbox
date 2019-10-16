component {

    property name="log" inject="logbox:logger:{this}";
    property name="dao";

    function all( filters = {}) {
        log.debug( "logging all" );
        return dao.getAll( filters );
    }

    function find( id ) {
        log.info( "logging all" );

        var users = dao.get( arguments.id );
        if ( users.isEmpty() ) {
            log.warn( "logging all" );
            throw( type = "UserNotFound", message = "There is not User with an id of #arguments.id#" );
        }
        return users[ 1 ];
    }

}
