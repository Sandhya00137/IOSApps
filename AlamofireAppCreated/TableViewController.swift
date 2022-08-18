//
//  TableViewController.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    let viewModel = TableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        let createPostNib = UINib(nibName: "PostsTableViewCell", bundle: nil)
        tableView.register(createPostNib, forCellReuseIdentifier: "cell")
        initBinding()
        viewModel.gettingDataOfPost()
    }

    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getPostModel.value.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsTableViewCell
        cell.postDataLabel.text = viewModel.getPostModel.value[indexPath.row].postData
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func initBinding(){
        viewModel.getPostModel.addObserver(fireNow:false){ [weak self ] (getPostModel) in
            self?.tableView.reloadData()
        }
        
    }
    
    
    
}
