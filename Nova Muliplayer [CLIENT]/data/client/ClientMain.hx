import sys.net.Socket;
import sys.net.Host;
import haxe.io.Bytes;

var address = {
    host: "hand-google.gl.at.ply.gg",//"basic-fabrics.gl.at.ply.gg",
    port: 11325
}

var socket;

var running = true;

function create() {
    socket = new Socket();
    socket.connect(new Host(address.host), address.port);
    socket.output.writeString("false");
    socket.output.flush();
    socket.close();
    
    var serverSocket = Socket();
    serverSocket.connect(new Host(address.host), address.port);
    while (running) {
        serverData = serverSocket.input.readAll();
        if (serverData != null) {
            trace(serverData);
        }
    }

}

function update(k) {
    var message = FlxG.keys.justPressed.I ? "up" : FlxG.keys.justPressed.K ? "down" : "none";
    if (FlxG.keys.justPressed.I || FlxG.keys.justPressed.K || FlxG.keys.justReleased.I || FlxG.keys.justReleased.K) {
        socket = new Socket();
        socket.connect(new Host(address.host), address.port);
        // socket.setFastSend(true);
        socket.output.writeString(message);
        socket.output.flush();
        socket.close();
    }
}

function destory() {
    running = false;
    socket.close();
}