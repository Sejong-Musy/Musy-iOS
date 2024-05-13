//
//  CreateMusicDemoApp.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import CreateMusicFeature
import CreateMusicInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture


@main
struct CreateMusicDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CreateMusicView(store: .init(initialState: .init(), reducer: {
                CreateMusicFeature()
            }))
        }
    }
}

#Preview {
    CreateMusicView(store: .init(initialState: .init(), reducer: {
        CreateMusicFeature()
    }))
}
