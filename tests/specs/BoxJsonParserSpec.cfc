component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "box.json parser", () => {
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
