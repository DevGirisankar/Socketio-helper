# Socketio-helper
Singleton class for socket manager 

# usage 

```swift 
let soc  = SocketHelper.shared
soc.socket?.on("something)") {data, ack in
  print(data)
}     
soc.connect()
```
Disconnect 
```swift 
soc.disconnect
```
Connect listener 
```swift
soc.socket?.on(clientEvent: .connect) { data, ack in
  print(data)
  print("socket connected")
}
```
Disconnect listener
```swift
soc.socket?.on(clientEvent: .disconnect) { data, ack in
  print(data)
  print("socket disconnect")
}
```

Note: All listeners must include before calling ```soc.connect()```
