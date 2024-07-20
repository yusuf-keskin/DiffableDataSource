//
//  HomeInteractor.swift
//  DiffableDataSource
//
//  Created by YUSUF KESKİN on 20.07.2024.
//

import Foundation

protocol HomeInteractor_InputsDelegate : AnyObject {
    func downloadFakeData()
}

protocol HomeInteractor_OutputsDelegate : AnyObject {
    func didDownloadObjects(objects: [HomeObject])
}

class HomeInteractor {
    weak var presenter : HomeInteractor_OutputsDelegate?
}


extension HomeInteractor : HomeInteractor_InputsDelegate {
    func downloadFakeData() {
        // fake api call
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            let objectArray  =
            [
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!"),
                HomeObject(name: "Apple iOS", title: "What a codebase!")
            ]
            self.presenter?.didDownloadObjects(objects: objectArray)
        }
    }
}
