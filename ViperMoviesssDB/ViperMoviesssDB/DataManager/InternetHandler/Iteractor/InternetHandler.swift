//
//  InternetHandler.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import Network


/*
 *      QUEUE ACTIONS:  queue.suspend() -- queue.resume() -- queue.finalize()
 */

class InternetHandler: InternetConectionProtocol {
    
    var monitor: NWPathMonitor
    var queue: DispatchQueue
    var isQueueRunning: Bool
    
    init(named queueName: String) {
        
        self.monitor = NWPathMonitor(requiredInterfaceType: .cellular)
        self.queue = DispatchQueue(label: queueName)
        self.isQueueRunning = true
        
        monitorPathUpdateHandler()
        
        self.monitor.start(queue: self.queue)
        
        
    }
    
    fileprivate func monitorPathUpdateHandler () {
        self.monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.pathIsSatisfied()
            } else if path.status == .unsatisfied {
                self.pathIsntSatisfied()
            } else {
                print("Path error: \(path.status)")
                fatalError()
            }
        }
    }
    
    func resumeInternetHandler() {
        if !self.isQueueRunning {
            self.queue.resume()
            self.isQueueRunning = true
        }
    }
    
    func stopInternetHandler() {
        if self.isQueueRunning {
            self.queue.suspend()
        }
    }
    
    func pathIsntSatisfied() {
        
//        jogar tela dizendo que o usuário n tem conecção com a internet
        
        
        
    }
    
    func pathIsSatisfied() {
        
        // continuar normalmente? acho que nem precisa dessa validação
        
        
    }
    
    
}
