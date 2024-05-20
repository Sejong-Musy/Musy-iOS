//
//  SignInViewInterface.swift
//  CreateMusicInterface
//
//  Created by 박근경 on 2024/05/20.
//

import SwiftUI
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

public protocol SignInViewInterface where Self: View {
    init(store: StoreOf<SignInFeature>)
}
