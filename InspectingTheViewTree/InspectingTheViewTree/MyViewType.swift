//
//  MyViewType.swift
//  InspectingTheViewTree
//
//  Created by 남기범 on 2022/10/28.
//

import Foundation
import SwiftUI

enum MyViewType: Equatable {
    case formContainer
    case fieldContainer
    case field(Int)
    case title
    case miniMapArea
}

struct MyPreferenceData: Identifiable {
    let id = UUID()
    let viewType: MyViewType
    let bounds: Anchor<CGRect>
    
    func getColor() -> Color {
        switch viewType {
        case .field(let length):
            return length == 0 ? .red : (length < 3 ? .yellow : .green)
        case .title:
            return .purple
        default:
            return .gray
        }
    }
    
    func show() -> Bool {
        switch viewType {
        case .title:
            return true
        case .fieldContainer:
            return true
        case .field:
            return true
        default:
            return false
        }
    }
}

struct MyPreferenceKey: PreferenceKey {
    static var defaultValue: [MyPreferenceData] = []
    
    static func reduce(value: inout [MyPreferenceData], nextValue: () -> [MyPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
