//
//  DefaultCell.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class DefaultCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .colorText
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.circle"))
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 4
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        return imageView
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGrayBack
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        layer.masksToBounds = true
        backgroundColor = .grayBack
        addSubview(titleLabel)
        addSubview(iconImageView)
        addSubview(arrowImageView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 56),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16)
            
        ])
    }
    override func prepareForReuse() {
        layer.cornerRadius = 0
        titleLabel.text = ""
    }
    
    func setConfig(item: DefaultItem, maskCorner: CACornerMask) {
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = maskCorner
        titleLabel.text = item.title
        if item.image.isEmpty {
            iconImageView.image = nil
            return
        }
        iconImageView.backgroundColor = .black
        iconImageView.image = UIImage(named: item.image)
    }
}

