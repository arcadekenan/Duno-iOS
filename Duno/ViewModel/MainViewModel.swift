//
//  MainViewModel.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import Foundation

protocol MainViewModelDelegate: class {
    func hostGame(userName: String, numberOfPlayers: Int)
    func joinGame(userName: String, sessionCode: String)
}

class MainViewModel: MainViewModelDelegate {
    
    //MARK: Variables
    weak var delegate: MainViewControllerProtocol?
    
    public func hostGame(userName: String, numberOfPlayers: Int) {
        print("VM hostGame \(userName) -- \(numberOfPlayers)")
        delegate?.successHostGame()
    }
    
    public func joinGame(userName: String, sessionCode: String) {
        print("VM joinGame \(userName) -- \(sessionCode)")
        delegate?.successJoinGame()
    }
}
