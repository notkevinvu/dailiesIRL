//
//  HomeView.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 3/12/21.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Properties
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        // item size at 1.0/1.0 fractional width/height means item will expand
        // to fill its group's size
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let cellItem = NSCollectionLayoutItem(layoutSize: itemSize)
        cellItem.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 20,
            bottom: 10,
            trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1/5))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: cellItem,
            count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        view.register(DailyCollectionViewCell.self, forCellWithReuseIdentifier: DailyCollectionViewCell.identifier)
        
        return view
    }()
    
    
    // MARK: - Object lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupSubviews()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // we can get the frame/bounds of a view in layoutSubviews()!!
        addGradientToBackgroundView()
    }
    
    // MARK: - Setup subviews
    private func addSubviews() {
        addSubview(backgroundView)
        addSubview(collectionView)
    }
    
    private func configureBackgroundViewConstraints() {
        
        let backgroundTopAnchor = backgroundView.topAnchor.constraint(equalTo: topAnchor)
        let backgroundBottomAnchor = backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        backgroundBottomAnchor.priority = UILayoutPriority(999)
        
        let backgroundLeadingAnchor = backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let backgroundTrailingAnchor = backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor)
        backgroundTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            backgroundTopAnchor,
            backgroundBottomAnchor,
            backgroundLeadingAnchor,
            backgroundTrailingAnchor
        ])
    }
    
    private func configureCollectionViewConstraints() {
        
        let collectionTopAnchor = collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let collectionBottomAnchor = collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        collectionBottomAnchor.priority = UILayoutPriority(999)
        
        
        let collectionLeadingAnchor = collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let collectionTrailingAnchor = collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        collectionTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            collectionTopAnchor,
            collectionBottomAnchor,
            collectionLeadingAnchor,
            collectionTrailingAnchor
        ])
    }
    
    private func setupSubviews() {
        addSubviews()
        configureBackgroundViewConstraints()
        configureCollectionViewConstraints()
    }
    
    private func addGradientToBackgroundView() {
        let gradientLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            let topColor = UIColor(hex: "4568DC")?.cgColor
            let bottomColor = UIColor(hex: "B06AB3")?.cgColor
            layer.colors = [topColor!, bottomColor!]
            // gradient starts at top left, ends bot right
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 1, y: 1)
            
            return layer
        }()
        
        gradientLayer.frame = backgroundView.bounds
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
}
