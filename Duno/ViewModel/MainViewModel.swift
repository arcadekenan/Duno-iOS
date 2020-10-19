//
//  MainViewModel.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import Foundation

protocol MainViewModelDelegate: class {
    func hostGame(userName: String, numberOfPlayers: Int)
}

class MainViewModel: MainViewModelDelegate {
    
    //MARK: Variables
    weak var delegate: MainViewControllerProtocol?
    
    public func hostGame(userName: String, numberOfPlayers: Int) {
        print("we are on")
        delegate?.successHostGame()
    }
}
