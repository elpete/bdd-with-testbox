component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "boxJson Parser integration style", () => {
            it( "can return the version in the box.json file", function() {
                // arrange
                var parsedFile = new BoxJsonParser( "/tests/resources/sample.box.json" );
                expect( parsedFile.getVersion() ).toBe( "2.5.1" );
            } );
        } );
    }

}
