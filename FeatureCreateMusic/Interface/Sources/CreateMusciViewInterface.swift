//
//  CreateMusciViewInterface.swift
//  CreateMusicInterface
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

public protocol CreateMusciViewInterface where Self: View {
    init(store: StoreOf<CreateMusicFeature>)
}
