//
//  ViewController.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/24/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private var contentView = HomeView()
    
    private var dailyStore: DailyStoreProtocol
    private var dataSource: UICollectionViewDiffableDataSource<Section, NaiveDaily>?
    
    init() {
        let dependencyContainer = DependencyContainer()
        
        dailyStore = dependencyContainer.makeDailyStore()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getDailies()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Dailies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationItem.standardAppearance = appearance
        // this changes the color of the nav bar background?
//        navigationItem.scrollEdgeAppearance = appearance
    }
    
    private func setupView() {
        view.backgroundColor = .red
        view = contentView
    }
    
    private func setup() {
        setupNavigationBar()
        setupView()
    }
    
    private func setupCollectionView() {
//        contentView.collectionView.delegate = self
//        contentView.collectionView.dataSource = self
        
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, NaiveDaily> { (cell, indexPath, daily) in
            
            var content = cell.defaultContentConfiguration()
            content.text = daily.name
            cell.contentConfiguration = content
            cell.accessories = [.disclosureIndicator()]
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, NaiveDaily>(collectionView: contentView.collectionView) { collectionView, indexPath, item in
            
            collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
        }
        
    }
    
    // MARK: - Data methods
    
    private func getDailies() {
        dailyStore.fetchDailies { [dataSource] (dailies) in
            var snapshot = NSDiffableDataSourceSnapshot<Section, NaiveDaily>()
            snapshot.appendSections([.main])
            snapshot.appendItems(dailies)
            dataSource?.apply(snapshot)
        }
    }
    
}

extension HomeViewController {
    enum Section {
        case main
    }
}
