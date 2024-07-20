//
//  HomePresenter.swift
//  DiffableDataSource
//
//  Created by YUSUF KESKİN on 20.07.2024.
//

import UIKit

class HomePresenter : NSObject {
    var interactor : HomeInteractor_InputsDelegate?
    var router : HomeRouter_InputsDelegate?
    weak var view : HomeView_InputsDelegate?
    private var homeObjects = [HomeObject]()
}

extension HomePresenter: HomeView_Outputs_Delegate {
    
    func setTableViewDatasSource(tableView: UITableView) {
        tableView.dataSource = self
    }
    

    func viewDidLoad() {
        interactor?.downloadFakeData()
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        let object = homeObjects[indexPath.row]
        router?.routeWithName(object.name)
    }
}

extension HomePresenter : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = homeObjects[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = object.name
        return cell
    }
}

extension HomePresenter : HomeInteractor_OutputsDelegate {
    func didDownloadObjects(objects: [HomeObject]) {
        homeObjects = objects
        view?.reloadTableView()
    }
}

