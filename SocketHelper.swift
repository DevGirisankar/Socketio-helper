import Foundation
import UIKit
import SocketIO


class SocketHelper:NSObject {
    
    private let kSocketBaseUrl = /// url
    
    static let shared = SocketHelper()
    
    private var manager: SocketManager?
     var socket: SocketIOClient?
    
    override init() {
        super.init()
        configureSocket()
    }
    
    private func configureSocket() {
        
        guard let url = URL(string: kSocketBaseUrl) else {
            return
        }
        
        manager = SocketManager(socketURL: url, config: [.log(true), .compress, .forceWebsockets(true),.reconnects(false)])
        // reconnects changed to false not to reconnect automatically 
        
        guard let manager = manager else {
            return
        }
        
        socket = manager.defaultSocket
    }
    
    func connect() {
        
        guard let socket = manager?.defaultSocket else{
            return
        }
        
        socket.connect()
    }
    
    func disconnet() {
        
        guard let socket = manager?.defaultSocket else{
            return
        }
        
        socket.disconnect()
    }
}
