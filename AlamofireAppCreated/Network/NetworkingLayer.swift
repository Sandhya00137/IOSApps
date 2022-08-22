//
//  NetworkingLayer.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import Foundation
import Alamofire

class NetworkingLayer {
    
    func getMethodApiCalling<T : Codable>(_ url :    URL ,completion :@escaping(T)->()){
        AF.request(url, method:.get).validate(statusCode: 200 ..< 299).responseDecodable(of: T.self) { response in
            switch response.result
            {
            case .success(_) :
                guard let value = response.value else {
                    return
                }
                completion(value)
                print(value)
            case .failure(_) :
                print("errors")
                
            }
        }
        
    }
    
    func putMethodApiCalling<T : Codable,U :Codable>(_ url: URL , encode : T  ,completion :@escaping(U)->Void){
        AF.request(url, method: .put, parameters: encode ).validate(statusCode: 200..<299).responseDecodable(of : U.self){ response in
            switch response.result
            {
            case .success(_) :
                print((response))
                guard let value = response.value else {
                    return
                }
                completion(value)
            case .failure(_) :
                print("error")
                
            }
            
        }
    }
    
}
