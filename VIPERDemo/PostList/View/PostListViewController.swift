//
//  PostListViewController.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import UIKit

class PostListViewController: UITableViewController, PostListViewProtocol {
    
    var presenter: PostListPresenterProtocol?
    
    private var postCells: [PostCell] = []
    
    func showPostList(postCells: [PostCell]) {
        self.postCells = postCells
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError() {
        print("Error fetching posts.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Posts"
        
        self.presenter?.viewLoaded()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.posts.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTitleCell", for: indexPath)

        let post = postCells[indexPath.row]
        cell.textLabel?.text = post.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectPostAtRow(rowIndex: indexPath.item)
    }
}
