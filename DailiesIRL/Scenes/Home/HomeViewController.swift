//
//  ViewController.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/24/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Dailies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
    }
    
    private func setup() {
        setupNavigationBar()
        setupView()
    }
    
}

