//
//  PostDetailViewController.swift
//  VIPERDemo
//
//  Created by Balaganesh on 21/04/23.
//

import UIKit

class PostDetailViewController: UIViewController, PostDetailViewProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var presenter: PostDetailPresenterProtocol?
    
    func setPost(title: String, body: String) {
        titleLabel.text = title
        bodyTextView.text = body
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Post Detail"
        self.bodyTextView.textContainerInset = .zero
        self.bodyTextView.textContainer.lineFragmentPadding = 0
        
        presenter?.viewLoaded()
    }
}
