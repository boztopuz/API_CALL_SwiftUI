//
//  MainViewModel.swift
//  APICall
//
//  Created by Burak Öztopuz on 4.06.2023.
//

import Foundation
import UIKit
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var models: [ModelElement] = []
    
    func getData() {
        APICaller.callData { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.models = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
