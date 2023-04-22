//
//  PostListInteractor.swift
//  VIPERDemo
//
//  Created by Balaganesh on 20/04/23.
//

import Foundation

class PostListInteractor: PostListInteractorProtocol {
    
    weak var presenter: PostListPresenterProtocol?
    
    private var postsURL = "https://dummyjson.com/posts?limit=20"
    
    func fetchPosts() {
        let url = URL(string: postsURL)!
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { [unowned self] data, response, error in
            if (error != nil) {
                self.presenter?.didFailFetchingPosts()
            }
            
            guard let data = data  else {
                self.presenter?.didFailFetchingPosts()
                return
            }
            
            do {
                let posts = try JSONDecoder().decode(Posts.self, from: data)
                self.presenter?.didFetchPosts(posts: posts.posts)
            } catch {
                self.presenter?.didFailFetchingPosts()
            }
                    
        }.resume()
    }
}
