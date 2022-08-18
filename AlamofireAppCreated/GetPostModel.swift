//"
//  Model.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import Foundation
struct GetPostsModel:Codable{
    let status ,message : String?
    let data : [GetPostData]
    let errorCode : String?
}
struct GetPostData : Codable{
    let postId : Int?
    let userName : String?
    let postData : String?
    let totalLikes : Int?
    let likeStatus : Bool?
    let iscreated : String?
    let userId : Int?
}
