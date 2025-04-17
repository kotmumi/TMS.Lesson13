//
//  SettingView.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 13.04.25.
//

import UIKit

class SettingView: UIView {
    
    let settingsTableView = SettingTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemGroupedBackground
        addSubview(settingsTableView)
        settingsTableView.separatorInset.left = 56
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: topAnchor),
            settingsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            settingsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            settingsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
