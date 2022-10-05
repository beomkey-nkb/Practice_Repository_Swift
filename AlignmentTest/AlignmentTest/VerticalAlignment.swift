//
//  VerticalAlignment.swift
//  AlignmentTest
//
//  Created by 남기범 on 2022/10/04.
//

import Foundation
import SwiftUI

extension VerticalAlignment {
    struct CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    
    static let custom = VerticalAlignment(CustomAlignment.self)
}
