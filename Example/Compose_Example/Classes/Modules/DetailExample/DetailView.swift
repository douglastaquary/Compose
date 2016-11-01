//
//  DetailView.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

@IBDesignable
class DetailView: CollectionStackView {

    var viewState = DetailViewState() {
        didSet {
            self.container.state = ComposeDetailView(with: viewState, expandCallback: self.expandDescription)
        }
    }

    private func expandDescription() {
        viewState.descriptionExpanded = true
    }
    
}

func ComposeDetailView(with state: DetailViewState, expandCallback:@escaping (()-> Void))-> [ComposingUnit] {
    var units: [ComposingUnit] = []
    units.add {
        let header = DetailViewUnits.HeaderUnit()
        let detailUnit = DetailViewUnits.DetailInfoUnit(with: state)
        let photos = DetailViewUnits.PhotosUnit(colors: state.photos)
        return [header, detailUnit, photos]
    }
    units.add(manyIfLet: state.description) { text in
        let header = DetailViewUnits.HeaderDescriptionUnit(header: "Descrição do imóvel")
        let description = DetailViewUnits.DescriptionUnit(text: text, expanded: state.descriptionExpanded)
        return [header, description]
    }
    units.add(if: state.description != nil && !state.descriptionExpanded) {
        let expand = DetailViewUnits.ExpandDescriptionUnit(callback: expandCallback)
        return expand
    }
    units.append(DetailViewUnits.SpacerUnit(id: "bottom-spacer", height: 40))
    
    return units
}
