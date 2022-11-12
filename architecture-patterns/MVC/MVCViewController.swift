//
//  ViewController.swift
//  architecture-patterns
//
//  Created by Daria Sechko on 7.11.22.
//

import UIKit
import SnapKit

final class MVCViewController: UIViewController {
    
    private var service: PincodeService
    
    private var pincodeModel: String = "- - - -" {
        didSet {
            pincodeLabel.text = pincodeModel
        }
    }
    
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
        button.addTarget(self, action: #selector(receivePincodeAction), for: .touchUpInside)
    
        return button
    }()
    
    //MARK: - Lifecycle
    
    init(service: PincodeService) {
        self.service = service
        super.init(nibName: nil, bundle: nil) //designed initializer -> создает контроллер
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    @objc private func receivePincodeAction() {
        
        service.fetchPincode { pincode in
            self.pincodeModel = pincode
        }
    }
}

extension MVCViewController {
    
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
