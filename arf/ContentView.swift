//
//  ContentView.swift
//  arf
//
//  Created by Max Nonisa on 2/18/22.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    @State private var areControlsVisable: Bool = false
    @State private var showBrowse: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom){
            ARViewContainer()
            
            ControlView(areControlsVisable: $areControlsVisable, showBrowse: $showBrowse)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer:
                            
    UIViewRepresentable{
    
    func makeUIView(context: Context) -> UIView {
    let arView = ARView(frame: .zero)
    return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
