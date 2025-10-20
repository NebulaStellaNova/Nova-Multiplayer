import funkin.backend.scripting.MultiThreadedScript;

var serverScript;

function postCreate() {
    serverScript = new MultiThreadedScript(Paths.script("data/client/ClientMain"));
    serverScript.call("create");
}

function update() {
    serverScript.call("update", [FlxG.keys]);
}

function destory() {
    serverScript.call("destory");
}