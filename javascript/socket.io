설치
  . npm install socket.io -g

서버/클라이언트 통신
  . Polling방식
    client가 서버에 요청 후 응답을 받는 방식
  . Long Poll방식
    Polling방식의 단점인 반복적인 요청으로 응답을 받는 형태에서 Client가 서버에대한 요청을
    유지하여 반복적인 요청을 없애고, 유효한 이벤트가 발생하면 응답을 해주는 방식
  . WebSocket방식
    Client와 서버가 연결이 된 후 부터는 HTTP요청/응답과는 상관없이
    양방향 통신이 가능한 형태.
    요청이없어도 이벤트에따라 응답이 가능한 것 같음.

데이터 바인딩
  . socket.set('key', 'value', function(){});
  . socket.get('key', function(err, value){});
  . socket.del('key', function(err, value){});

Grouping
  . Room을 사용하게 되면 braodcast를 하더라도 같은 room안에있는
    클라이언트에게만 이벤트가 전송된다.
  . socket.join('room name');   해당 룸에 바인딩
  . socket.leave('room name');  룸에서 나옴
  . io.sockets.in('room name').emit('event', message);
    room name 룸 안에 있는 모든 클라이언트에게 이벤트 보내기
  . socket.broadcast.to('room name').emit('event', message);
    room name 룸 안에 나를 제외한 모든 클라이언트들에게 이벤트 보내기
  . io.sockets.manager.rooms
    현재 생성되어 있는 모든 room의 목록을 리턴
  . io.sockets.clients('room name');
    room name 룸 안에 있는 모든 클라이언트 소켓 목록을 리턴
