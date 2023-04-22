//
//  PostDetailPresenter.swift
//  VIPERDemo
//
//  Created by Balaganesh on 21/04/23.
//

import UIKit

class PostDetailPresenter: PostDetailPresenterProtocol {
    
    var post: PostModel!
    
    weak var view: PostDetailViewProtocol?
    
    func viewLoaded() {
        view?.setPost(title: post.title, body: post.body)
    }
}
