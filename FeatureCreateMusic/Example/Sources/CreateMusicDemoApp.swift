//
//  SignInDemo.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import SwiftUI
import CreateMusicFeature
import CreateMusicInterface
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

@main
struct LoginDemoApp: App {
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
