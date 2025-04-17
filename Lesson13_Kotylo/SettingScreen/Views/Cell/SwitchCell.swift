//
//  SwitchCell.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class SwitchCell: DefaultCell {
    
    let switchControl: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(iconImageView)
        addSubview(switchControl)
    }
    override func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            
            switchControl.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            switchControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }
    
    func setConfig(item: SwitchItem, maskCorner: CACornerMask) {
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = maskCorner
        switchControl.isOn = item.isOn
        titleLabel.text = item.title
        if item.image.isEmpty {
            iconImageView.image = nil
            return
        }
        iconImageView.backgroundColor = .black
        iconImageView.image = UIImage(named: item.image)
    }
}
