//
//  NewViewController.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 16.04.25.
//

import UIKit

class NewViewController: UIViewController {

    private let newView: NewView
    
    init(title: String) {
        newView = NewView(title: title)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
   
    }
}
