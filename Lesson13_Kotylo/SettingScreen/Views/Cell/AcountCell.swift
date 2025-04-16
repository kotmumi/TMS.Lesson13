//
//  AcountCell.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class AcountCell: UITableViewCell {
    
    static let identifier: String = "AcountCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .colorText
        return label
    }()
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .lightGrayBack
        return label
    }()
    let iconImageView: UIImageView = {
        let imageView = UIImageView()//(image: UIImage(systemName: "person.circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGrayBack
        imageView.layer.cornerRadius = 32
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
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .grayBack
        addSubview(titleLabel)
        addSubview(iconImageView)
        addSubview(discriptionLabel)
        addSubview(arrowImageView)
    }
    private func setConstraints() {
        NSLayoutConstraint.activate( [
            
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            iconImageView.widthAnchor.constraint(equalToConstant: 64),
            iconImageView.heightAnchor.constraint(equalToConstant: 64),
            
            titleLabel.bottomAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            
            discriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            discriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    func setConfig(item: AccountItem, maskCorner: CACornerMask) {
        self.layer.cornerRadius = 8
        self.layer.maskedCorners = maskCorner
        titleLabel.text = item.title
        discriptionLabel.text = item.discription
        iconImageView.image = UIImage(systemName: item.image)
    }
}
