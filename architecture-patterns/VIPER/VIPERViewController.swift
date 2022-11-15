//
//  VIPERViewController.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 15.11.22.
//

import UIKit

protocol VIPERViewInput: AnyObject {
    func showPincode(_ value: String)
}

protocol VIPERViewOutput: AnyObject {
    func didPressPincodeButton()
}

class VIPERViewController: UIViewController  {
    
    var output: VIPERViewOutput!
    
    private lazy var pincodeLabel: UILabel = {
        var label = UILabel()
        
        label.text = "- - - -"
        label.textAlignment = .center
        label.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        return label
    }()
    
    private lazy var receivePincodeButton: UIButton = {
        var button = UIButton()
        
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("Получить Пин-код", for: .normal)
        button.backgroundColor = .lightGray.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(didPressPincodeButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(pincodeLabel)
        view.addSubview(receivePincodeButton)
    }
    
    //MARK: - Actions
    
    @objc private func didPressPincodeButton() {
        output.didPressPincodeButton()
    }
}

extension VIPERViewController: VIPERViewInput {
    
    func showPincode(_ value: String) {
        pincodeLabel.text = value
    }
}

extension VIPERViewController {
    
    class Layout {
        static var topHeaderOffset = 50
        static var topOffset = 20
    }
    
    private func setupConstraints() {
        
        pincodeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Layout.topHeaderOffset)
        }
        
        receivePincodeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pincodeLabel.snp.bottom).offset(Layout.topOffset)
        }
    }
}





