import sys.net.Socket;
import sys.net.Host;
import haxe.io.Bytes;


var address = {
    host: "0.0.0.0",//"basic-fabrics.gl.at.ply.gg",
    port: 11325
}

var serverSocket;

var running = true;

function create() {
    serverSocket = new Socket();
    serverSocket.bind(new Host(address.host), address.port);
    serverSocket.listen(5); // Listen for up to 5 pending connections
    trace("Server listening on port " + address.port + "...");
    try {
        // Bind the server socket to a specific port

        while (running) { // Loop to accept multiple clients
            var clientSocket = serverSocket.accept();
            // trace("Client connected from: " + clientSocket.peer().host.toString() + ":" + clientSocket.peer().port);
            // Receive data from the client
            var receivedData = clientSocket.input.readAll();
            if (receivedData.toString() == "up") {
                FlxG.state.changeItem(-1);
            } else if (receivedData.toString() == "down") {
                FlxG.state.changeItem(1);
            }
            /* trace("Received from client: " + receivedData.toString());

            // Send data back to the client
            var response = "Server received: " + receivedData.toString();
            clientSocket.output.writeString(response);
            clientSocket.output.flush();
 */
            // clientSocket.close();
        }
    } catch (e:Dynamic) {
        trace("Server error: " + e);
    } /* finally {
        serverSocket.close();
        trace("Server socket closed.");
    } */
    // socket.close();
    
}

function update() {
}

function destory() {
    running = false;
    serverSocket.close();
}
