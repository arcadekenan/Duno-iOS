//
//  MainViewController.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import UIKit

protocol MainViewControllerProtocol: class {
    func successHostGame()
    func successJoinGame()
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    // MARK: UIOutlets
    private lazy var mainStackView: UIStackView = UIStackView()
    private lazy var hostButton: MenuButton = MenuButton()
    private lazy var hostMenuForm: MenuForm = MenuForm(type: .host)
    private lazy var joinButton: MenuButton = MenuButton()
    private lazy var joinMenuForm: MenuForm = MenuForm(type: .join)
    
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
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(hostButton)
        mainStackView.addArrangedSubview(hostMenuForm)
        mainStackView.addArrangedSubview(joinButton)
        mainStackView.addArrangedSubview(joinMenuForm)
    }
    
    private func buildViewConstraints() {
        mainStackViewConstraints()
        hostButtonConstraints()
        hostMenuFormConstraints()
        joinButtonConstraints()
        joinMenuFormConstraints()
    }
    
    private func mainStackViewConstraints() {
        mainStackView.distribution = .equalSpacing
        mainStackView.spacing = 20
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func hostButtonConstraints() {
        hostButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func hostMenuFormConstraints() {
        hostMenuForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostMenuForm.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func joinButtonConstraints() {
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            joinButton.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func joinMenuFormConstraints() {
        joinMenuForm.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            joinMenuForm.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        vmDelegate = viewModel
        hostMenuForm.isHidden = true
        hostMenuForm.alpha = 0
        joinMenuForm.isHidden = true
        hostMenuForm.alpha = 0
        applyStyles()
        applyActions()
    }
    
    // MARK: Local Functions
    private func displayForms(show: Bool, form: MenuFormType) {
        UIView.animate(withDuration: 0.5) {
            switch form {
            case .host:
                self.hostMenuForm.isHidden = show
                self.hostMenuForm.alpha = show ? 0 : 1
            case .join:
                self.joinMenuForm.isHidden = show
                self.joinMenuForm.alpha = show ? 0 : 1
            }
        }
    }
    
    // MARK: Styles
    private func applyStyles() {
        view.backgroundColor = .white
        hostButtonStyle()
        joinButtonStyle()
    }
    
    private func hostButtonStyle() {
        hostButton.textLabel.text = "Host Game"
        hostMenuForm.submitButton.textLabel.text = "Create Game"
    }
    
    private func joinButtonStyle() {
        joinButton.textLabel.text = "Join Game"
        joinMenuForm.submitButton.textLabel.text = "Enter Game"
    }
    
    // MARK: Actions
    private func applyActions() {
        hostButton.containerView.addTarget(self, action: #selector(displayHostForm(sender:)), for: .touchUpInside)
        hostMenuForm.submitButton.containerView.addTarget(self, action: #selector(hostGame(sender:)), for: .touchUpInside)
        joinButton.containerView.addTarget(self, action: #selector(displayJoinForm(sender:)), for: .touchUpInside)
        joinMenuForm.submitButton.containerView.addTarget(self, action: #selector(joinGame(sender:)), for: .touchUpInside)
    }
    
    @objc private func displayHostForm(sender: UIControl) {
        displayForms(show: !hostMenuForm.isHidden, form: .host)
    }
    
    @objc private func displayJoinForm(sender: UIControl) {
        displayForms(show: !joinMenuForm.isHidden, form: .join)
    }
    
    @objc private func hostGame(sender: UIControl) {
        guard
            let userName = hostMenuForm.nameTextField.mainTextField.text,
            let numberOfPlayers = hostMenuForm.numberOfPlayersTextField.mainTextField.text
        else { return }
        vmDelegate?.hostGame(userName: userName, numberOfPlayers: Int(numberOfPlayers) ?? 0)
    }
    
    @objc private func joinGame(sender: UIControl) {
        guard
            let userName = joinMenuForm.nameTextField.mainTextField.text,
            let sessionCode = joinMenuForm.sessionCodeTextField.mainTextField.text
        else { return }
        vmDelegate?.joinGame(userName: userName, sessionCode: sessionCode)
    }
    
    // MARK: Delegates
    public func successHostGame() {
        print("It Works: Game Created")
    }
    
    public func successJoinGame() {
        print("It Works: Game Joined")
    }
}

