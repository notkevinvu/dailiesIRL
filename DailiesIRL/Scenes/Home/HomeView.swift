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
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 30
//        layout.itemSize = CGSize(width: 360, height: 110)
//        // bottom edge inset added to allow users to scroll up more to see last deck
//        // if there are more than 4 decks
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    
    // MARK: - Object lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupSubviews()
        backgroundColor = .white
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
    private func setupSubviews() {
        addSubview(backgroundView)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    private func addGradientToBackgroundView() {
        let gradientLayer: CAGradientLayer = {
            let layer = CAGradientLayer()
            let topColor = UIColor(hex: "4568DC")?.cgColor
            let bottomColor = UIColor(hex: "B06AB3")?.cgColor
            layer.colors = [topColor, bottomColor]
            // gradient starts at top left, ends bot right
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 1, y: 1)
            
            return layer
        }()
        
        gradientLayer.frame = backgroundView.bounds
        backgroundView.layer.addSublayer(gradientLayer)
    }
    
}
