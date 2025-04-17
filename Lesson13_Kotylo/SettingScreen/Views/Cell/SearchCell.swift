//
//  SearchCell.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 16.04.25.
//

import UIKit

class SearchCell: UITableViewCell {
    
    // Объявляем констрейнт как свойство
    var heightConstraint: NSLayoutConstraint!
    var topAnchorConstraint: NSLayoutConstraint!
    
    let separatorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Настройки"
        label.textColor = .colorText
        label.font = .systemFont(ofSize: 32, weight: .medium)
        return label
    }()
    
    let search: UISearchTextField = {
        let textField = UISearchTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .seachBack
        textField.placeholder = "Поиск"

        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        addSubview(separatorLabel)
        addSubview(search)
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            //heightAnchor.constraint(equalToConstant: 68),
            separatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorLabel.heightAnchor.constraint(equalToConstant: 32),
            
            search.topAnchor.constraint(equalTo: separatorLabel.bottomAnchor, constant: 4),
            search.leadingAnchor.constraint(equalTo: leadingAnchor),
            search.trailingAnchor.constraint(equalTo: trailingAnchor),
           // search.heightAnchor.constraint(equalToConstant: 32),
            search.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        topAnchorConstraint = separatorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        topAnchorConstraint.isActive = true
        heightConstraint = search.heightAnchor.constraint(equalToConstant: 32)
        heightConstraint.isActive = true
    }
}
