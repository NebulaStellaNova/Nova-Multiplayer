import funkin.backend.scripting.MultiThreadedScript;

function postCreate() {
    var serverScript = new MultiThreadedScript(Paths.script("data/client/ClientMain"));
    serverScript.call("create");
}