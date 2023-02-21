//
//  ViewController.swift
//  SnapKitExample
//
//  Created by Maxim Baranov on 13.01.23.
//

import SnapKit
import UIKit

final class StartSceneViewController: UIViewController {

    private let nextScreenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.backgroundColor = .systemBackground
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupButton()
    }
    
    // MARK: – Private functions
    private func setupViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupButton() {
        nextScreenButton.addTarget(self, action: #selector(pushViewControllerAction), for: .touchDown)
        
        view.addSubview(nextScreenButton)
        nextScreenButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.height.equalTo(60)
            make.width.equalTo(120)
        }
    }
    
    // MARK: - Objc functions
    
    @objc func pushViewControllerAction(sender: UIButton) {
        let mainViewController = HobbiesListViewController()
        navigationController?.pushViewController(mainViewController, animated: false)
    }

}

