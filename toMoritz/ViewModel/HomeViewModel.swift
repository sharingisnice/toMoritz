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
    
    let networkHelper = NetworkHelper()
    
    var returnedData : Account?

    //Couldn't find what to do with the regex tbh.
    func isAccountNameValid(name: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "[a-z1-5.]{1,12}")
        let range = NSRange(location: 0, length: name.utf16.count)
        
        return regex.firstMatch(in: name, options: [], range: range) != nil
    }
    
    
    
    func makeRequest(accountName:String ,withURLString: String) -> Observable<Account> {
        
        return Observable.create { osberver -> Disposable in
            self.networkHelper.post(params: ["account_name":accountName], url: withURLString)
            return "val" as! Disposable
            //TODO: these values should be filled to the infoArray object so we can print them in the tableView of the HomeViewController
        }
        
    }
    
    
    
}
