component {

    property name="path";
    property name="fileContent";

    function init( required string path ) {
        variables.path = arguments.path;
        return this;
    }

    function getDevDependencies() {
        return getParsedJson().devDependencies;
    }

    function getVersion() {
        return getParsedJson().version;
    }

    function getParsedJson() {
        if ( isNull( variables.fileContent ) ) {
            variables.fileContent = loadFile();
        }
        if ( ! isJSON( variables.fileContent ) ) {
            throw( type = "InvalidBoxJson" );
        }
        return deserializeJSON( variables.fileContent );
    }

    function loadFile() {
        return fileRead( variables.path );
    }

}
