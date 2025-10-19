import sys.net.Socket;
import sys.net.Host;
import haxe.io.Bytes;

var address = {
    host: "localhost",//"basic-fabrics.gl.at.ply.gg",
    port: 1232
}

var socket = new Socket();

function create() {
    socket = new Socket();
    // Connect to a server at a specific host and port
    socket.connect(new Host(address.host), address.port);
    trace("Connected to server.");

    // Send data to the server
    var message = "Hello from HaxeFlixel!";
    socket.output.writeString(message);
    socket.output.flush();

    // Receive data from the server (blocking call, consider threads for non-blocking)
    var receivedData = socket.input.readAll();
    trace("Received from server: " + receivedData.toString());


    socket.close();
}