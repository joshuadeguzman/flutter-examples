// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

var app = require('express')();
var http = require('http').createServer(app);
var io = require('socket.io')(http);

const PORT = process.env.PORT || 8080

app.get('/', (req, res) => {
    res.send('Server is running.')
});

app.get('/chat', (req, res) => {
    res.sendFile(__dirname + '/index.html');
});

io.on('connection', (socket) => {
    console.log(`connected =>  ${socket.id}`);

    socket.on('disconnect', () => {
        console.log(`disconnected =>  ${socket.id}`);
    });

    socket.on('send_message', (msg) => {
        console.log('message: ' + msg);
        io.emit('receive_message', msg);
    });

    socket.on('typing', (msg) => {
        io.emit('typing', socket.id);
    });
});

http.listen(PORT, () => console.log(`listening on port => ${PORT}`));