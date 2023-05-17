component {

    property name="path";
    property name="fileContent";

    function init( required string path ) {
        variables.path = arguments.path;
        return this;
    }

    public struct function getDevDependencies() {
        return getParsedJson().devDependencies;
    }

    public string function getVersion() {
        return getParsedJson().version;
    }

    private struct function getParsedJson() {
        if ( isNull( variables.fileContent ) ) {
            variables.fileContent = loadFile();
        }
        if ( ! isJSON( variables.fileContent ) ) {
            throw( type = "InvalidBoxJson" );
        }
        return deserializeJSON( variables.fileContent );
    }

    private string function loadFile() {
        return fileRead( variables.path );
    }

}
