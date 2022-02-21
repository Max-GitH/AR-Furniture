//
//  BrowseView.swift
//  arf
//
//  Created by Max Nonisa on 2/20/22.
//

import SwiftUI

struct BrowseView: View {
    @Binding var showBrowse: Bool
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                //gridviews for thumbnails
            }
            .navigationBarTitle(Text("Browse"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showBrowse.toggle()
            }){
                Text("Done").bold()
            })
        }
    }
}
