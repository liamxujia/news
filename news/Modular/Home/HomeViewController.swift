//
//  HomeViewController.swift
//  news
//
//  Created by stlndm on 2018/10/23.
//  Copyright © 2018 stlndm. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(NSClassFromString(viewModel.newsPlainTextCellIdentifer), forCellReuseIdentifier: viewModel.newsPlainTextCellIdentifer)
        return tableView
    }()
}

extension HomeViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :UITableViewCell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
        return cell
    }
}
