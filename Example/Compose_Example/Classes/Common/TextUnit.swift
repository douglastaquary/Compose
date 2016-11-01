//
//  TextUnit.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit
import Compose

struct TextUnit: SelectableUnit {

    typealias TableCell = UITableViewCell
    
    let font: UIFont = UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)
    let smallFont: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFontWeightLight)
    
    let attrText: NSAttributedString
    let going: Bool?
    let identifier: String
    let minHeight: CGFloat
    let callback: ((ComposingUnit)-> Void)?
    
    init(id: String, text: String, going: Bool? = nil, minHeight: CGFloat = 54, callback: ((ComposingUnit)-> Void)? = nil) {
        identifier = id
        self.going = going
        self.callback = callback
        self.minHeight = minHeight
        let topStr = NSMutableAttributedString(string: text, attributes: [NSFontAttributeName: font])
        if let going = going {
            topStr.append(NSAttributedString(string: "\n\(going ? "is going" : "is not going")", attributes: [NSFontAttributeName: smallFont]))    
        }
        self.attrText = topStr as NSAttributedString
    }
    
    func configure(view: UIView) {
        guard let cell = view as? TableCell else { return }
        cell.textLabel?.attributedText = attrText
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = callback != nil ? .disclosureIndicator : .none
        cell.selectionStyle = .none
    }
    
    func didSelect() {
        callback?(self)
    }
    
    var heightUnit: DimensionUnit {
        return DimensionUnit { size in
            let frame = self.attrText.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
            return max(self.minHeight, frame.height)
        }
    }
    
    func register(in tableView: UITableView) {
        TableCell.register(in: tableView)
    }
    
    func reuseIdentifier() -> String {
        return TableCell.identifier()
    }
    
}
