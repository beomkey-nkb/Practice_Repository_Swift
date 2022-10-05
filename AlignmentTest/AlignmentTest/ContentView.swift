//
//  ContentView.swift
//  AlignmentTest
//
//  Created by 남기범 on 2022/10/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .custom) {
            Image(systemName: "star")
            VStack(alignment: .center) {
                Text("Toronto")
                Text("Paris")
                Text("London")
                    .alignmentGuide(.custom) {
                        $0[VerticalAlignment.center]
                    }
                Text("Madrid")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
