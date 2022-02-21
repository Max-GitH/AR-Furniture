//
//  ControlView.swift
//  arf
//
//  Created by Max Nonisa on 2/19/22.
//

import SwiftUI

struct ControlView: View {
    @Binding var areControlsVisable: Bool
    @Binding var showBrowse: Bool
    
    var body: some View{
        VStack{
            ControlVisibilityToggleButton(areControlsVisable: $areControlsVisable)

            Spacer()
            
            if areControlsVisable{
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}

struct ControlVisibilityToggleButton: View {
    @Binding var areControlsVisable: Bool
    
    var body: some View{
        HStack{
            Spacer()
            
            ZStack{
                Color.black.opacity(0.25)
                
                Button(
                    action: {
                        print("control vis button pressed")
                        self.areControlsVisable.toggle()
                    }
                ) {Image(systemName: self.areControlsVisable ? "rectangle": "slider.horizontal.below.rectangle")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
                    }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
        }
        .padding(.top, 45)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar: View {
    @Binding var showBrowse: Bool
    
    var body: some View{
        HStack{
//            most recently placed button
            ControlButton(systemIconName: "clock.fill"){
                print("MostRecentlyPlaced button pressed")
            }
            
            Spacer()
            
//            browse button
            ControlButton(systemIconName: "square.grid.2x2"){
                print("Browse button pressed")
                self.showBrowse.toggle()
            }.sheet(isPresented: $showBrowse, content: {
                BrowseView(showBrowse: $showBrowse)
                
            })
            
            Spacer()
            
//            settings button
            ControlButton(systemIconName: "slider.horizontal.3"){
                print("Settings button pressed")
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.red.opacity(0.25))
    }
}

struct ControlButton: View{
    let systemIconName: String
    let action: () -> Void
    
    var body: some View{
        Button(action: {
            self.action()
        })
        {Image (systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 50, height: 50)
    }
}
