//
//  HobbiesListCollcetionVIewCell.swift
//  SnapKitExample
//
//  Created by Maxim Baranov on 14.01.23.
//

import UIKit
import SnapKit

final class HobbiesListCollcetionVIewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "HobbiesListIdentifier"
    
    let hobbyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        return imageView
    }()
    
    let hobbyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.text = "Sport°"
        label.backgroundColor = .systemBackground
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
        configureContentView()
        setupHobbyImageConstraints()
        setupHobbyNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal functions
    
    func configure(viewModel: HobbiesModel) {
        hobbyImage.image = UIImage(systemName: viewModel.hobbyImage)
        hobbyNameLabel.text = viewModel.hobbyName
    }
    
    // MARK: - Private functions

    private func configureContentView() {
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
    }
    
    private func setupHobbyImageConstraints() {
        contentView.addSubview(hobbyImage)

        hobbyImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(5)
        }
    }
    
    private func setupHobbyNameLabelConstraints() {
        contentView.addSubview(hobbyNameLabel)
        
        hobbyNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(hobbyImage.snp.trailing).offset(10)
        }
    }
}
