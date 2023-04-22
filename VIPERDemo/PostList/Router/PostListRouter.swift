//
//  PostListRouter.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import UIKit

class PostListRouter: PostListRouterProtocol {
    
    static func createPostListModule() -> UIViewController {
        
        if let navigationController = mainStoryboard.instantiateViewController(identifier: "PostListViewNavigationController") as? UINavigationController,
           let viewController = navigationController.viewControllers.first as? PostListViewController {
            
            let presenter: PostListPresenterProtocol = PostListPresenter()
            let interactor: PostListInteractorProtocol = PostListInteractor()
            let router: PostListRouterProtocol = PostListRouter()
            
            presenter.view = viewController
            presenter.router = router
            presenter.interactor = interactor
            
            interactor.presenter = presenter
            
            viewController.presenter = presenter
            
            return navigationController
        }
        
        return UIViewController()
    }
    
    func presentPostDetailScreen(from viewController: PostListViewProtocol, forPost post: PostModel) {
        if let navigationController = viewController.navigationController {   
            PostDetailRouter.showPostDetailViewOn(navigationController: navigationController, withPost: post)
        }
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
