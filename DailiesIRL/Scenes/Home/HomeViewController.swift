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
        setupCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDailies()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Dailies"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
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
        dataSource = UICollectionViewDiffableDataSource<Section, NaiveDaily>(collectionView: contentView.collectionView) { collectionView, indexPath, item in
            
            // the cell provider closure essentially functions as the
            // cellForItemAt: collection view method
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyCollectionViewCell.identifier, for: indexPath) as? DailyCollectionViewCell
            
            cell?.titleLabel.text = item.name
            
            return cell
        }
    }
    
    // MARK: - Data methods
    
    private func getDailies() {
        dailyStore.fetchDailies { [dataSource] (result) in
            switch result {
            case .success(let dailies):
                var snapshot = NSDiffableDataSourceSnapshot<Section, NaiveDaily>()
                snapshot.appendSections([.currentDaily])
                snapshot.appendItems(dailies)
                dataSource?.apply(snapshot)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


extension HomeViewController {
    enum Section {
        case currentDaily,
             remainingDailies
    }
}
