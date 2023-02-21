//
//  MainViewController.swift
//  SnapKitExample
//
//  Created by Maxim Baranov on 13.01.23.
//

import UIKit
import SnapKit

final class HobbiesListViewController: UITabBarController {
    
    private var hobbiesListCollectionView: UICollectionView!
    
    private let viewModel = HobbiesListViewModel()
    
    var sizingCell: HobbiesListCollcetionVIewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupCollectionView()
        setupCollectionViewConstraints()
        
    }
    
    // MARK: Private functions
    
    private func setupViewController() {
        view.backgroundColor = .systemOrange
    }
    
    private func setupCollectionView() {
        let layout = TagFlowLayout()
       
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 5
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
//        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        hobbiesListCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        hobbiesListCollectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        hobbiesListCollectionView.backgroundColor = .systemBackground
        
        hobbiesListCollectionView.dataSource = self
        hobbiesListCollectionView.delegate = self
        
        
        hobbiesListCollectionView.register(HobbiesListCollcetionVIewCell.self, forCellWithReuseIdentifier: HobbiesListCollcetionVIewCell.reuseIdentifier)

    }
    
    private func setupCollectionViewConstraints() {
        view.addSubview(hobbiesListCollectionView)
        hobbiesListCollectionView.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height)
        }
    }
    
    
}

// MARK: - Extension
extension HobbiesListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.hobbiesListViewModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HobbiesListCollcetionVIewCell.reuseIdentifier, for: indexPath) as! HobbiesListCollcetionVIewCell
        cell.configure(viewModel: viewModel.hobbiesListViewModels![indexPath.row])
        return cell
    }
    
    
}
 
extension HobbiesListViewController: UICollectionViewDelegate {
    
}

extension HobbiesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = viewModel.hobbiesListViewModels![indexPath.row].hobbyName
        let titleWidth = (title.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])).width
        let test = viewModel.hobbiesListViewModels![indexPath.row].hobbyImage   
        let titleWidth2 = (test.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])).width
//        print("Width is ", width)
        return CGSize(width: titleWidth + 50, height: 34)
    }

    
}
