//
//  HomeViewModel.swift
//  toMoritz
//
//  Created by Mert Ejder on 22.05.2022.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    var accountName = ""
    var infoArray = [String]()
    
    
    func isAccountNameValid(name: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "[a-z1-5.]{1,12}")
        let range = NSRange(location: 0, length: name.utf16.count)
        
        return regex.firstMatch(in: name, options: [], range: range) != nil
    }
    
    
    
    func makeRequest() {
        
        if let url = URL(string: "") {
            let req = URLRequest(url: url)
        
            let response = URLSession.shared.rx.json(request: req)
            
            URLSession.shared.rx.response(request: req)
                .flatMap { response, data in
                    if let response = response as? HTTPURLResponse {
                        
                    }
                }
            
            
        }
        
        
        
    }
    
    
    
}
