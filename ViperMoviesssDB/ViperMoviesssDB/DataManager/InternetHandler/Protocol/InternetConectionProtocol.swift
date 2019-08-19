//
//  InternetConectionProtocol.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation
import Network

protocol InternetConectionProtocol {
    
    var monitor: NWPathMonitor { get set }
    var queue: DispatchQueue { get set }
    var isQueueRunning: Bool { get set }
    
    func resumeInternetHandler ()
    
    func stopInternetHandler ()
    
    func pathIsntSatisfied ()
    
    func pathIsSatisfied ()
    
}
