//
//  ViewModel.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import Foundation
class TableViewModel{
    let network = NetworkingLayer()
    var getPostModel = Observable<[GetPostData]>(value: [])
    func gettingDataOfPost()
    {
        network.getDataFromApi {  response in
            self.getPostModel.value = response
            
        }
    }
}
