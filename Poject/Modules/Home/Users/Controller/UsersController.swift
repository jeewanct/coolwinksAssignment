//
//  UsersController.swift
//  Poject
//
//  Created by jeevan tiwari on 04/04/20.
//  Copyright © 2020 jeevan tiwari. All rights reserved.
//

import UIKit

class UsersController: BaseViewController {

    @IBOutlet weak var tableView: BaseTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customInit()
        addListener()
        viewModel.users()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigation(true)
    }
    
    lazy var viewModel: UserViewModel = {
        UserViewModel()
    }()
}

extension UsersController: Customize{
    func addListener() {
        viewModel.showHUD.bind { [unowned self](show) in
            self.showHUD(show)
        }
        viewModel.reloadTable.bind { [unowned self](reload) in
            self.tableView.reloadData()
        }
        viewModel.userChats.bind { [unowned self](chats) in
            self.push(UserChatsController.chats(chats, title: self.viewModel.selectedUser))
        }
    }
    func customInit() {
        configureNav()
        tableView.registerCells(UserTableCell.self)
    }
}

extension UsersController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.dequeueCell(UserTableCell.self, viewModel.usersList?[indexPath.item])
    }
}

extension UsersController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedUser(indexPath.item)
    }
}

extension UsersController{
    static func users(_ image: UIImage, _ title: String) -> UIViewController{
        let controller: UsersController = UIViewController.load()
        controller.tabBarItem.image     = image
        controller.tabBarItem.title     = title
        return UINavigationController(rootViewController: controller)
    }
}
