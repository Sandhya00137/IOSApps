//
//  PostsTableViewCell.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 17/08/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell ,CellConfigurable {
    
    @IBOutlet weak  var postImage : UIImageView!
    @IBOutlet weak  var postDataLabel : UILabel!
    @IBOutlet weak  var likeImageButton : UIButton!
    @IBOutlet weak  var profileImage : UIImageView!
    @IBOutlet weak  var userNameLabel : UILabel!
    @IBOutlet weak  var likeCountLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    var viewmodel : PostTableViewCellViewModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialView()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInitialView()
    }
    @objc func btnPressed(sender : UIButton) {
        viewmodel?.likeBtnPressed?()
    }

    func setupInitialView() {
        likeImageButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        self.selectionStyle = .none
    }
    
    func setup(viewModel  : RowViewModel){
        guard let viewModel = viewModel as? PostTableViewCellViewModel else{
            return
        }
        postDataLabel.text = viewModel.postData
        userNameLabel.text = viewModel.username
        likeCountLabel.text = String(viewModel.likeButtonCount)
        likeImageButton.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        viewModel.likeButtonImage.addObserver { [weak self] (image) in
            self?.likeImageButton.setImage(image.image, for: .normal)
        
        }
        setNeedsLayout()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        viewmodel?.likeButtonImage.removeObserver()
    }
   
    
}
