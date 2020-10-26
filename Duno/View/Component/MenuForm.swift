//
//  MenuForm.swift
//  Duno
//
//  Created by Davi Bispo on 22/10/20.
//

import UIKit

enum MenuFormType: String {
    case host = "host"
    case join = "join"
}

class MenuForm: UIView {
    
    // MARK: UIOutlets
    public lazy var containerView: UIView = UIView()
    public lazy var mainStackView: UIStackView = UIStackView()
    public lazy var nameTextField: MenuTextField = MenuTextField(placeholder: "Player Name")
    public lazy var sessionCodeTextField: MenuTextField = MenuTextField(placeholder: "Game Code")
    public lazy var numberOfPlayersTextField: MenuTextField = MenuTextField(placeholder: "Number of players")
    public lazy var submitButton: MenuButton = MenuButton()
    
    // MARK: Variables
    public var formType: MenuFormType?
    
    // MARK: Initializers
    init(type: MenuFormType) {
        super.init(frame: CGRect.zero)
        formType = type
        buildViewHierarchy()
        buildViewConstraints()
        addStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Builders
    func buildViewHierarchy() {
        containerView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(nameTextField)
        if (formType == .host) {
            mainStackView.addArrangedSubview(numberOfPlayersTextField)
        }
        if (formType == .join) {
            mainStackView.addArrangedSubview(sessionCodeTextField)
        }
        mainStackView.addArrangedSubview(submitButton)
        self.addSubview(containerView)
    }
    
    func buildViewConstraints() {
        containerViewConstraints()
        mainStackViewConstraints()
        nameTextFieldConstraints()
        if (formType == .host) {
            numberOfPlayersTextFieldConstraints()
        }
        if (formType == .join) {
            sessionCodeTextFieldConstraints()
        }
        submitButtonConstraints()
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func mainStackViewConstraints() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func nameTextFieldConstraints() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func numberOfPlayersTextFieldConstraints() {
        numberOfPlayersTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfPlayersTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func sessionCodeTextFieldConstraints() {
        sessionCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sessionCodeTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func submitButtonConstraints() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: Styles
    func addStyles() {
//        containerViewStyle()
    }

}
