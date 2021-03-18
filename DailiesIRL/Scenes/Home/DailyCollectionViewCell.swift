//
//  DailyCollectionViewCell.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 3/17/21.
//

import UIKit

final class DailyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var identifier: String = "DailyCollectionViewCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    
    // MARK: - Object lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View methods
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // MARK: - Setup
    private func addSubviews() {
        contentView.addSubview(titleLabel)
    }
    
    private func setupSubviews() {
        // setting view of cell here
        backgroundColor = .white
        layer.cornerRadius = 25
        setDropShadow(
            opacity: 0.2,
            offset: .init(width: 0, height: 3),
            radius: 6)
        layer.masksToBounds = false
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // constraints setup here
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.readableContentGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor)
        ])
    }
}
