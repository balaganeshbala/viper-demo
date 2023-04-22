//
//  PostListPresenter.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import Foundation

class PostListPresenter: PostListPresenterProtocol {
    
    weak var view: PostListViewProtocol?
    
    var interactor: PostListInteractorProtocol?
    
    var router: PostListRouterProtocol?
    
    var posts: [PostModel] = []
    
    func viewLoaded() {
        interactor?.fetchPosts()
    }
    
    func didFetchPosts(posts: [PostModel]) {
        self.posts = posts
        let postCells = posts.map { PostCell(title: $0.title) }
        view?.showPostList(postCells: postCells)
    }
    
    func didFailFetchingPosts() {
        view?.showError()
    }
    
    func didSelectPostAtRow(rowIndex: Int) {
        if let listView = view {
            let selectedPost = posts[rowIndex]
            router?.presentPostDetailScreen(from: listView, forPost: selectedPost)
        }
    }
}
