//
//  ContentView.swift
//  InspectingTheViewTree
//
//  Created by 남기범 on 2022/10/28.
//

import SwiftUI

struct ContentView: View {
    @State private var fieldValues = Array<String>(repeating: "", count: 5)
    @State private var length: Float = 360
    @State private var twitterFieldPreset = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(alignment: .center) {
                Color(white: 0.7)
                    .frame(width: 200)
                    .anchorPreference(key: MyPreferenceKey.self, value: .bounds) {
                        return [MyPreferenceData(viewType: .miniMapArea, bounds: $0)]
                    }
                    .padding(.horizontal, 30)
                
                VStack(alignment: .leading) {
                    VStack {
                        Text("Hello \(fieldValues[0]) \(fieldValues[1]) \(fieldValues[2])")
                            .font(.title).fontWeight(.bold)
                            .anchorPreference(key: MyPreferenceKey.self, value: .bounds) {
                                return [MyPreferenceData.init(viewType: .title, bounds: $0)]
                            }
                        Divider()
                    }
                    
                    HStack {
                        Toggle(isOn: $twitterFieldPreset) { Text("") }
                        
                        Slider(value: $length, in: 360...540).layoutPriority(1)
                    }.padding(.bottom, 5)
                    
                    HStack {
                        MyFormField(fieldValue: $fieldValues[0], label: "First Name")
                        MyFormField(fieldValue: $fieldValues[1], label: "Middle Name")
                        MyFormField(fieldValue: $fieldValues[2], label: "Last Name")
                    }.frame(width: 540)
                    
                    HStack {
                        MyFormField(fieldValue: $fieldValues[3], label: "Email")
                        
                        if twitterFieldPreset {
                            MyFormField(fieldValue: $fieldValues[4], label: "Twitter")
                        }
                        
                        
                    }.frame(width: CGFloat(length))
                }.transformAnchorPreference(key: MyPreferenceKey.self, value: .bounds) {
                    $0.append(MyPreferenceData(viewType: .formContainer, bounds: $1))
                }
                
                Spacer()
            }
            .overlayPreferenceValue(MyPreferenceKey.self) { preferences in
                GeometryReader { geometry in
                    MiniMap(geometry: geometry, preferences: preferences)
                }
            }
            
            Spacer()
        }.background(Color(white: 0.8)).edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
