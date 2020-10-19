//
//  MainViewController.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import UIKit

protocol MainViewControllerProtocol: class {
    func successHostGame()
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    // MARK: UIOutlets
    private lazy var hostButton: MenuButton = MenuButton()
    
    // MARK: Variables
    private lazy var viewModel: MainViewModel = MainViewModel()
    private var vmDelegate: MainViewModelDelegate?
    
    // MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
        buildViewHierarchy()
        buildViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Builders
    private func buildViewHierarchy() {
        view.addSubview(hostButton)
    }
    
    private func buildViewConstraints() {
        hostButtonConstraints()
    }
    
    private func hostButtonConstraints() {
        hostButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hostButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            hostButton.widthAnchor.constraint(equalToConstant: 200),
            hostButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        vmDelegate = viewModel
        applyStyles()
        applyActions()
    }
    
    // MARK: Styles
    private func applyStyles() {
        view.backgroundColor = .white
        hostButtonStyle()
    }
    
    private func hostButtonStyle() {
        hostButton.textLabel.text = "Host Game"
    }
    
    // MARK: Actions
    private func applyActions() {
        hostButton.containerView.addTarget(self, action: #selector(hostGame(sender:)), for: .touchUpInside)
    }
    
    @objc private func hostGame(sender: UIControl) {
        print("hosting a game")
        vmDelegate?.hostGame(userName: "????", numberOfPlayers: 5)
    }
    
    // MARK: Delegates
    public func successHostGame() {
        print("It Works")
    }
}

