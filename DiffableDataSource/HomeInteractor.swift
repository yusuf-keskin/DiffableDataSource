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
                HomeObject(name: "Apple iOS 1", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 2", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 3", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 4", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 5", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 6", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 7", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 8", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 9", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 10", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 11", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 13", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 14", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 15", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 16", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 17", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 18", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 19", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 20", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 21", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 22", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 23", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 24", title: "What a codebase!"),
                HomeObject(name: "Apple iOS 25", title: "What a codebase!")
            ]
            self.presenter?.didDownloadObjects(objects: objectArray)
        }
    }
}
