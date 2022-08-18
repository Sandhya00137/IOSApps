//
//  NetworkingLayer.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import Foundation
import Alamofire
class NetworkingLayer {
    func getDataFromApi(completion :@escaping([GetPostData])->())
    {
        AF.request("http://stagetao.gcf.education:3000/api/v1/posts/2", method: .get).responseDecodable(of: GetPostsModel.self) { response in
            switch response.result
            {
            case .success(_) :
                print((response))
                completion(response.value!.data)
            case .failure(_) :
                print("error")
            
            }
      }
        
    }

}
