//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by YUSUF KESKİN on 20.07.2024.
//

import UIKit

protocol HomeView_InputsDelegate: AnyObject {
    func reloadTableView() 
}

protocol HomeView_Outputs_Delegate: AnyObject {
    func viewDidLoad()
    func didSelectRowAt(indexPath: IndexPath)
    
    //MARK: DiffableDataSource
    func setDiffableDataSource(tableView : UITableView)
}

class HomeViewController: UIViewController {

    private var homeObjects = [HomeObject]()
    var presenter : HomeView_Outputs_Delegate?
    
    private lazy var mainLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        addSubviews()
        presenter?.viewDidLoad()
        setTableViewDataSource()
    }
    
    private func setTableViewDataSource() {        
        //MARK: DiffableDataSource
        presenter?.setDiffableDataSource(tableView: tableView)
    }
    
    private func addSubviews() {
        view.addSubview(mainLabel)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
        print("Cell selected")
    }
    
}

extension HomeViewController : HomeView_InputsDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {[ weak self ] in
            self?.tableView.reloadData()
        }
    }
}
