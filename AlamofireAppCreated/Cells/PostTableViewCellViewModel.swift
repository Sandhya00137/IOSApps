//
//  postTableViewModel.swift
//  AlamofireAppCreated
//
//  Created by Sandhya Kollati on 18/08/22.
//

import Foundation
import UIKit

class PostTableViewCellViewModel : RowViewModel{
    let username : String
    let postData :  String
    let postId : Int
    let userId : Int
    var likeBtnPressed: (() -> Void)?
    var likeButtonCount : Int
    var likeButtonImage : Observable<CodableImage>
   
    init(username : String , postData: String,likeBtnPressed: (() -> Void)? = nil,likeButtonCount: Int, likeButtonImage : Observable<CodableImage> = Observable<CodableImage>(value: CodableImage(image: UIImage(systemName: "hand.thumbsup")!)),postId : Int ,userId : Int)
     {
        self.username = username
        self.postData = postData
        self.likeBtnPressed = likeBtnPressed
        self.likeButtonImage = likeButtonImage
         self.likeButtonCount = likeButtonCount
         self.postId = postId
         self.userId = userId
     }
    
    
}
