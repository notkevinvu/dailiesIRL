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
    
    private let checkmarkImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(systemName: "checkmark.circle.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = UIColor(hex: "26CC68")
        
        return view
    }()
    
    
    // MARK: - Object lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



// MARK: - Setup
extension DailyCollectionViewCell {
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(checkmarkImageView)
    }
    
    private func configureLabelConstraints() {
        // good to set priority of 2 constraints to 999 (i.e. not max):
        // one vertical and one horizontal - probably best to do bottom and trailing
        let labelTopAnchorConstraint = titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        let labelBottomAnchorConstraint = titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        labelBottomAnchorConstraint.priority = UILayoutPriority(999)
        let labelLeadingAnchorConstraint = titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64)
        let labelTrailingAnchorConstraint = titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -15)
        labelTrailingAnchorConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            labelTopAnchorConstraint,
            labelBottomAnchorConstraint,
            labelLeadingAnchorConstraint,
            labelTrailingAnchorConstraint
        ])
    }
    
    private func configureCheckmarkImageViewConstraints() {
        let checkmarkTopAnchorConstraint = checkmarkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        let checkmarkHeightAnchorConstraint = checkmarkImageView.heightAnchor.constraint(equalToConstant: 25)
        checkmarkHeightAnchorConstraint.priority = UILayoutPriority(999)
        
        let checkmarkLeadingAnchorConstraint = checkmarkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21)
        let checkmarkWidthAnchorConstraint = checkmarkImageView.widthAnchor.constraint(equalToConstant: 25)
        checkmarkWidthAnchorConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            checkmarkTopAnchorConstraint,
            checkmarkHeightAnchorConstraint,
            checkmarkLeadingAnchorConstraint,
            checkmarkWidthAnchorConstraint
        ])
    }
    
    private func configureSubviews() {
        // setting view of cell here
        backgroundColor = .white
        layer.cornerRadius = 25
        setDropShadow(
            opacity: 0.2,
            offset: .init(width: 0, height: 3),
            radius: 6)
        layer.masksToBounds = false
        
        configureLabelConstraints()
        configureCheckmarkImageViewConstraints()
    }
}
