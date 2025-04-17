//
//  SettingTableView.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 13.04.25.
//

import UIKit

class SettingTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGroupedBackground
    }
}
