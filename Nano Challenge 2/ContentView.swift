//
//  ContentView.swift
//  Nano Challenge 2
//
//  Created by Rafa (Ruffles) on 02/08/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
            let scene = GameScene()
            scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .resizeFill
            return scene
    }

    var body: some View {
        VStack {
            SpriteView(scene: scene)
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .ignoresSafeArea()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
