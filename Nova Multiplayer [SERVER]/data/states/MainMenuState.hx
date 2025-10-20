import funkin.backend.scripting.MultiThreadedScript;

var serverScript;

function postCreate() {
    serverScript = new MultiThreadedScript(Paths.script("data/server/ServerMain"));
    serverScript.call("create");
}

function update() {
    serverScript.call("update");
}

function destory() {
    serverScript.call("destory");
}