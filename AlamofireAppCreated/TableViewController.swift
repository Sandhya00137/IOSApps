//
//  TableViewController.swift
//  AlomofireLibrary
//
//  Created by Sandhya Kollati on 11/08/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewmodel : TableViewModel {
        return controller.viewmodel
    }
    lazy var controller: TableController = {
        return TableController()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let createPostNib = UINib(nibName: "PostsTableViewCell", bundle: nil)
        tableView.register(createPostNib, forCellReuseIdentifier: "cell")
        initBinding()
        controller.start()
    }
    func initBinding(){
        viewmodel.getPostModel.addObserver(fireNow:false){ [weak self ] (getPostModel) in
            self?.tableView.reloadData()
        }
        
    }

    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewmodel.getPostModel.value.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostsTableViewCell
        
        let  rowViewModel = viewmodel.getPostModel.value[indexPath.row]
        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel )
        }

        cell.layoutIfNeeded()
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    

}
