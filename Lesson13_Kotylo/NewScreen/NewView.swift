//
//  NewView.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 16.04.25.
//

import UIKit

class NewView: UIView {
    
    let title: String
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorText
        return label
    }()
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGroupedBackground
        addSubview(titleLabel)
        titleLabel.text = title
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
         
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
