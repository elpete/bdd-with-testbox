component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "UserService", () => {
            it( "can retrieve a list of users", function() {
                var daoMock = createStub().$( "getAll", [
                    { id = 1, username = "johndoe" },
                    { id = 2, username = "janedoe" }
                ] );
                var userService = createMock( "UserService" );
                userService.$property( propertyName = "dao", mock = daoMock );
                var actual = userService.all();
                expect( actual ).toBeArray();
                expect( actual ).toHaveLength( 2 );
            } );

            it( "can retrieve a single valid user", function() {
                var daoMock = createStub()
                    .$( "get" )
                    .$args( 1 )
                    .$results( [
                        { id = 1, username = "johndoe" }
                    ] );
                var userService = createMock( "UserService" );
                userService.$property( propertyName = "dao", mock = daoMock );

                var actual = userService.find( 1 );

                expect( actual ).toBeStruct();
                expect( actual.id ).toBe( 1 );
                expect( actual.username ).toBe( "johndoe" );
            } );

            it( "throws a UserNotFound exception when trying to retrieve a user with an invalid id", function() {
                var daoMock = createStub()
                    .$( "get" )
                    .$args( 1 )
                    .$results( [] );
                var userService = createMock( "UserService" );
                userService.$property( propertyName = "dao", mock = daoMock );

                expect( () => {
                    userService.find( 1 );
                } ).toThrow( "UserNotFound" );
            } );
        } )
    }

}
