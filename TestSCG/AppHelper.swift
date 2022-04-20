//
//  AppHelper.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation
import UIKit

let API_URL = "https://newsapi.org/v2/"
let API_KEY = "84f5af9e057b49c19ae76a2f6817d943"

class AppHelper{

    
    func getApiUrl(_ apiname:String)->String{
        return "\(API_URL)\(apiname)";
    }

    
    func getJSON(_ url :String, completion: @escaping (_ data :Data) -> (), failure: @escaping (_ error :String) -> ()) {
        
       
        
        let _rurl = self.getApiUrl(url)
       

        var request = URLRequest(url: URL(string: "\(_rurl)&apiKey=\(API_KEY)")!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data, error == nil else {
              failure(error?.localizedDescription ?? "error")
            return
          }
            
            if let httpResponse = response as? HTTPURLResponse {
                if(httpResponse.statusCode == 200){
                    completion(data)
                }else{
                    failure("api error code \(httpResponse.statusCode)")
                }
            }else{
                failure("api error Response")
            }
        }

        task.resume()
       
        
    }
    
    func setImg( _ url:String, completion: @escaping (_ img :UIImage) -> ()){
        let _url = URL(string: url)!
            // Create Data Task
            let dataTask = URLSession.shared.dataTask(with: _url) {(data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        completion(UIImage(data: data)!)
                    }
                }
            }
            //Start Data Task
            dataTask.resume()
    }
}
