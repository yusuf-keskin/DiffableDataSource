//
//  HomePresenter.swift
//  DiffableDataSource
//
//  Created by YUSUF KESKİN on 20.07.2024.
//

import UIKit

enum Section {
    case first
}

class HomePresenter : NSObject {
    var interactor : HomeInteractor_InputsDelegate?
    var router : HomeRouter_InputsDelegate?
    weak var view : HomeView_InputsDelegate?
    private var homeObjects = [HomeObject]()
    private var dataSource : UITableViewDiffableDataSource<Section, HomeObject>!
}

extension HomePresenter: HomeView_Outputs_Delegate {
    
    func viewDidLoad() {
        interactor?.downloadFakeData()
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        let object = homeObjects[indexPath.row]
        router?.routeWithName(object.name)
    }
    
    //MARK: DiffableDataSource
    func setDiffableDataSource(tableView : UITableView) {
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView, cellProvider: { tableView, indexPath, model in
                let cell = UITableViewCell()
                cell.textLabel?.text = model.name
                return cell
            })
    }
    
    private func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section,HomeObject>()
        snapshot.appendSections([.first])
        snapshot.appendItems(homeObjects)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension HomePresenter : HomeInteractor_OutputsDelegate {
    //MARK: DiffableDataSource
    func didDownloadObjects(objects: [HomeObject]) {
        homeObjects = objects
        updateDataSource()
    }
}
