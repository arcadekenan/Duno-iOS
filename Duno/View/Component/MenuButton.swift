//
//  MenuButton.swift
//  Duno
//
//  Created by Davi Bispo on 19/10/20.
//

import UIKit

class MenuButton: UIView {

    // MARK: UIOutlets
    public lazy var containerView: UIControl = UIControl()
    public lazy var textLabel: UILabel = UILabel()

    // MARK: Initializers
    init() {
        super.init(frame: CGRect.zero)
        buildViewHierarchy()
        buildViewConstraints()
        addStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Builders
    func buildViewHierarchy() {
        containerView.addSubview(textLabel)
        self.addSubview(containerView)
    }
    
    func buildViewConstraints() {
        containerViewConstraints()
        textLabelConstraints()
    }
    
    func containerViewConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func textLabelConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 80),
            textLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 40),
        ])
    }
    
    // MARK: Styles
    func addStyles() {
        containerViewStyle()
        textLabelStyle()
    }
    
    func containerViewStyle() {
        containerView.backgroundColor = .lightGray
        containerView.layer.borderWidth = 2
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func textLabelStyle() {
        textLabel.textColor = .white
        textLabel.textAlignment = .center
    }
}
