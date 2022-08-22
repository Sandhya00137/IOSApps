


//
//  TableController.swift
//  AlamofireAppCreated
//
//  Created by Sandhya Kollati on 19/08/22.
//


import Foundation
import UIKit
class TableController {
    
    let baseUrl = "http://stagetao.gcf.education:3000/"
    var userID = 89
    lazy var network: NetworkingLayer  = { return
        NetworkingLayer()
    }()
    
    lazy var viewmodel : TableViewModel = {
        return TableViewModel()
    }()
    func start() {
        guard let url = URL(string:"\(baseUrl)\(urls.getPosts.rawValue)\(userID)") else {
            return
        }
        network.getMethodApiCalling(url){ response in
            self.buildData(posts: response)
            
    }
    }
    

func buildData(posts : [GetPostData]) {
    
    var arrayOfData = [PostTableViewCellViewModel]()
    for post in posts {
        if let postdata = post as? GetPostData{
            let profileVM: PostTableViewCellViewModel = PostTableViewCellViewModel(username: postdata.userName ?? "", postData: postdata.postData ?? "", likeButtonCount: postdata.totalLikes ?? 0 , postId: postdata.postId ?? 0 ,userId: postdata.userId ?? 0)
            profileVM.likeBtnPressed = handleAddContact(postdata.postId ?? 0, userID ?? 0, status: postdata.likeStatus!, viewModel: profileVM)
            arrayOfData.append(profileVM)
        
        }
    }
}
func handleAddContact(
    _ postId : Int ,_ userId : Int ,status : Bool ,viewModel : PostTableViewCellViewModel) -> (() -> Void) {
    return { [weak viewModel] in
        viewModel?.likeButtonImage.value = CodableImage(image: UIImage(systemName: "hand.thumbsup.fill")!)
        guard let url = URL(string:"\(self.baseUrl)" + "\(urls.updateLikes.rawValue)\(postId)/\(userId)/\(status)") else{
            return
        }
        network.putMethodApiCalling(url, encode: nil as! UpdateLikesModel){ response in
            if response == true{
                self.start()
            }
            
        }
    }
 }
}
