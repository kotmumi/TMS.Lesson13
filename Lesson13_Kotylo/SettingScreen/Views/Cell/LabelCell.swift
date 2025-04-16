//
//  LabelCell.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class LabelCell: DefaultCell {
    
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.layer.masksToBounds = true
        return label
    }()
    
    func setConfig(item: LableItem, maskCorner: CACornerMask) {
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = maskCorner
        titleLabel.text = item.title
        discriptionLabel.text = item.discription
        if Int(item.discription) != nil {
            discriptionLabel.backgroundColor = .red
            discriptionLabel.textAlignment = .center
            discriptionLabel.textColor = .white
            discriptionLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
            discriptionLabel.widthAnchor.constraint(equalToConstant: 24).isActive = true
            discriptionLabel.layer.cornerRadius = 12
        }
        if item.image.isEmpty {
            iconImageView.image = nil
            return
        }
        iconImageView.backgroundColor = .black
        iconImageView.image = UIImage(named: item.image)
    }
    
    override func setupViews() {
        super.setupViews()
        addSubview(discriptionLabel)
        
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
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16),
            
            discriptionLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            discriptionLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
            
           
        ])
    }
}
