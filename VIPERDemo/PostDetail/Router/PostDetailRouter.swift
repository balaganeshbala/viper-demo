//
//  PostDetailRouter.swift
//  VIPERDemo
//
//  Created by Balaganesh on 21/04/23.
//

import UIKit

class PostDetailRouter: PostDetailRouterProtocol {
    
    static func showPostDetailViewOn(navigationController: UINavigationController, withPost post: PostModel) {
        
        if let detailViewController = mainStoryboard.instantiateViewController(identifier: "PostDetailViewController") as? PostDetailViewController {
            
            let presenter: PostDetailPresenterProtocol = PostDetailPresenter()
            presenter.post = post
            
            detailViewController.presenter = presenter
            presenter.view = detailViewController
            
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
