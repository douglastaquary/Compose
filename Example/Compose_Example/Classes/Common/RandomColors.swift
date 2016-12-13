//
//  RandomColors.swift
//  Compose_Example
//
//  Created by Bruno Bilescky on 25/10/16.
//  Copyright © 2016 VivaReal. All rights reserved.
//

import UIKit

func randomColors(maxColors: Int)-> [UIColor] {
    let colors: [UIColor] = [.red, .green, .blue, .magenta, .yellow, .purple, .darkGray, .cyan, .orange, .brown, .lightGray, .gray, .black]
    let colorsCount = UInt32(colors.count)
    let numberOfColors = Int(arc4random_uniform(UInt32(maxColors))) + 1
    return (0 ..< numberOfColors).map { _ in return colors[Int(arc4random_uniform(colorsCount))] }
}
