//
//  PostListProtocols.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import UIKit

protocol PostListViewProtocol: UIViewController {
    
    var presenter: PostListPresenterProtocol? { get set }
    
    func showPostList(postCells: [PostCell])
    func showError()
}

protocol PostListPresenterProtocol: AnyObject {
    
    var view: PostListViewProtocol? { get set }
    var interactor: PostListInteractorProtocol? { get set }
    var router: PostListRouterProtocol? { get set }
    
    var posts: [PostModel] { get set }
    
    func viewLoaded()
    func didFetchPosts(posts: [PostModel])
    func didFailFetchingPosts()
    func didSelectPostAtRow(rowIndex: Int)
}

protocol PostListInteractorProtocol: AnyObject {
    
    var presenter: PostListPresenterProtocol? { get set }
    
    func fetchPosts()
}

protocol PostListRouterProtocol: AnyObject {
    
    static func createPostListModule() -> UIViewController
    
    func presentPostDetailScreen(from viewController: PostListViewProtocol, forPost post: PostModel)
}
