//
//  PostDetailProtocols.swift
//  VIPERDemo
//
//  Created by Balaganesh on 21/04/23.
//

import UIKit

protocol PostDetailViewProtocol: UIViewController {
    
    var presenter: PostDetailPresenterProtocol? { get set }
    
    func setPost(title: String, body: String)
}

protocol PostDetailPresenterProtocol: AnyObject {
    
    var view: PostDetailViewProtocol? { get set }
    
    var post: PostModel! { get set }
    
    func viewLoaded()
}

protocol PostDetailRouterProtocol: AnyObject {
    static func showPostDetailViewOn(navigationController: UINavigationController, withPost post: PostModel)
}
