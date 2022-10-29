//
//  MyFormField.swift
//  InspectingTheViewTree
//
//  Created by 남기범 on 2022/10/28.
//

import SwiftUI

struct MyFormField: View {
    @Binding var fieldValue: String
    let label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField("", text: $fieldValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .anchorPreference(key: MyPreferenceKey.self, value: .bounds) {
                    return [MyPreferenceData(viewType: .field(self.fieldValue.count), bounds: $0)]
                }
        }
        .padding(15)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(white: 0.9)))
        .transformAnchorPreference(key: MyPreferenceKey.self, value: .bounds) {
            $0.append(MyPreferenceData(viewType: .fieldContainer, bounds: $1))
        }
    }
}

#if DEBUG
struct MyFormField_Previews: PreviewProvider {
    
    static var previews: some View {
        MyFormField(
            fieldValue: .constant("test"),
            label: "label"
        )
    }
}
#endif
