//
//  HobbiesListViewModel.swift
//  SnapKitExample
//
//  Created by Maxim Baranov on 14.01.23.
//

import Foundation

protocol HobbiesListViewModelProtocol { // Доступ к Model / обработка логики VC 
    var updateViewData: ((HobbiesModel) -> ())? { get set }
}

final class HobbiesListViewModel {
        
    // MARK: - Properties
    
    var hobbiesListViewModels: [HobbiesModel]?
    
    // MARK: - Init
    
    init() {
        configureViewModels()
    }

    // MARK: - Privates functions
    
    private func configureViewModels() {
        let sport = HobbiesModel(hobbyName: "Sport", hobbyImage: "heart")
        let photo = HobbiesModel(hobbyName: "Photo", hobbyImage: "trash.circle")
        let cooking = HobbiesModel(hobbyName: "Cooking", hobbyImage: "cup.and.saucer.fill")
        let programming = HobbiesModel(hobbyName: "Programming", hobbyImage: "keyboard")
        let dancing = HobbiesModel(hobbyName: "Dancing", hobbyImage: "figure.walk")
        let design = HobbiesModel(hobbyName: "Design", hobbyImage: "circle.grid.cross")
        let fashion = HobbiesModel(hobbyName: "Fashion", hobbyImage: "house.fill")
        let humor = HobbiesModel(hobbyName: "Humor", hobbyImage: "face.smiling.fill")
        let animals = HobbiesModel(hobbyName: "Animals", hobbyImage: "pawprint.fill")
        hobbiesListViewModels = [sport, photo, cooking,
                                 programming, dancing, design,
                                 fashion, humor, animals
                                ]
    }
}
