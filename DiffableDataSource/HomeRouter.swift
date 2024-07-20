//
//  HomeRouter.swift
//  DiffableDataSource
//
//  Created by YUSUF KESKİN on 20.07.2024.
//

import UIKit

protocol HomeRouter_InputsDelegate {
    func routeWithName(_ name : String)
}

class HomeRouter {
    weak var entryPoint : UINavigationController?
    
    func createHomeModule() -> UINavigationController {
        let homeView = HomeViewController()
        let navController = UINavigationController(rootViewController: homeView)
        let homeRouter = HomeRouter()
        
        let homePresenter = HomePresenter()
        let homeInteractor = HomeInteractor()

        homeView.presenter = homePresenter
        homePresenter.view = homeView
        
        homePresenter.interactor = homeInteractor
        homePresenter.router = homeRouter
        

        homeInteractor.presenter = homePresenter
        
        homeRouter.entryPoint = navController
        
        return navController
    }


}

extension HomeRouter : HomeRouter_InputsDelegate {
    func routeWithName(_ name : String) {
        let vc = TestVC()
        vc.labelText = name
        entryPoint?.pushViewController(vc, animated: true)
    }
}

class TestVC : UIViewController {
    
    var labelText : String?
    
    private lazy var label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont(name: "Avenir", size: 40.0)
        return label
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(label)
        navigationController?.navigationBar.backgroundColor = .white
        
        guard let labelText = labelText else { return }
        DispatchQueue.main.async {[ weak self] in
            self?.label.text = labelText
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
