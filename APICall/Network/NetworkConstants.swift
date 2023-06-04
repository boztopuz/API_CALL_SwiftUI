//
//  NetworkConstants.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import Foundation
import UIKit

class NetworkConstanst {
    
    public static var shared : NetworkConstanst = NetworkConstanst()
    
    private init(){
        
    }
    
    public var serverAddress: String {
        get {
            return "https://jsonplaceholder.typicode.com/photos"
        }
    }
}
