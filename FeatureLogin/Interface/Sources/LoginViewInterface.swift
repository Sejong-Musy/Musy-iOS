//
//  LoginViewInterface.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/8/24.
//

import SwiftUI
import Shared
import SharedThirdPartyLibrary
import ComposableArchitecture

public protocol LoginViewInterface where Self: View {
    init(store: StoreOf<LoginFeature>)
}
