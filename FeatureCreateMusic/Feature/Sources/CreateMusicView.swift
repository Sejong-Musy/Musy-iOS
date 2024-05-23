import SwiftUI
import CreateMusicInterface
import Shared
import SharedThirdPartyLibrary
import SharedDesignSystem
import ComposableArchitecture
import AuthenticationServices

public struct CreateMusicView: View, CreateMusicViewInterface {
    let store: StoreOf<CreateMusicFeature>
    
    public init(store: StoreOf<CreateMusicFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("ㄴㄴ")
    }
}

#Preview {
    CreateMusicView(store: .init(initialState: .init(), reducer: {
        CreateMusicFeature()
    }))
}
