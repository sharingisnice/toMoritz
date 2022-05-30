//
//  NetworkHelper.swift
//  toMoritz
//
//  Created by Mert Ejder on 30.05.2022.
//

import Foundation

class NetworkHelper {
    
    func post(params : Dictionary<String, String>, url : String) {
        guard let url = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        request.httpBody = try! JSONSerialization.data(withJSONObject: params)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard let data = data else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Account.self, from: data)
                print(result)
                
            } catch {
                print("issues decoding")
            }
            
        })
        
        task.resume()
    }
    
}
