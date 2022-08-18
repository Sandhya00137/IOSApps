//
//  PostsTableViewCell.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 17/08/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    let viewModel = TableViewModel()
    @IBOutlet weak  var postImage : UIImageView!
    @IBOutlet weak  var postDataLabel : UILabel!
    @IBOutlet weak  var likeImageButton : UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
}
