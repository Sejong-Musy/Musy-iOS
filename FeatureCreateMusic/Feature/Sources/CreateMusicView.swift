//
//  CreateMusicView.swift
//  CreateMusicFeature
//
//  Created by 김도형 on 5/12/24.
//

import SwiftUI
import CreateMusicInterface
import Domain
import Shared
import SharedDesignSystem
import SharedThirdPartyLibrary
import ComposableArchitecture
import SwiftUIFlowLayout
import SwiftUIIntrospect

public struct CreateMusicView: View, CreateMusciViewInterface {
    @Bindable var store: StoreOf<CreateMusicFeature>
    @State private var minute: Int = 2
    @State private var second: Int = 30
    
    public init(store: StoreOf<CreateMusicFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Group {
            switch store.phase {
            case .tag:
                tagSelection
                    .transition(
                        .move(edge: .bottom)
                        .combined(with: .blurReplace)
                        .combined(with: .opacity))
            case .length:
                lengthSelection
                    .transition(
                        .move(edge: .bottom)
                        .combined(with: .blurReplace)
                        .combined(with: .opacity))
            case .confirm:
                EmptyView()
            case .complete:
                EmptyView()
            }
            
        }
        .padding(.top, 120)
        .padding(.horizontal, 32)
        .background {
            LinearGradient.musyBright
        }
        .ignoresSafeArea()
    }
    
    private var tagSelection: some View {
        VStack(spacing: 36) {
            tagTitle
            
            genre
            
            intstrument
            
            Spacer()
            
            nextButton(title: "다음으로") {
                store.send(.nextButtonTapped, animation: .smooth(duration: 0.7))
            }
            .padding(.bottom, 72)
        }
    }
    
    private var tagTitle: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text("태그 선정하기")
                    .font(.musy(weight: .medium, size: 24))
                    .foregroundStyle(.white)
                
                Group {
                    Text("태그만 선정해주시면 MUSY가 제작해드려요\n하고 싶은 장르와 악기를 최소")
                        .font(.musy(weight: .light, size: 14)) +
                    Text(" 한 개 ")
                        .font(.musy(weight: .medium, size: 14)) +
                    Text("선정해주세요")
                        .font(.musy(weight: .light, size: 14))
                }
                .lineSpacing(8)
                .foregroundStyle(.white)
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func tagButton(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void) -> some View {
            Button(action: action) {
                TagView(
                    title: title,
                    size: 13,
                    isButton: true,
                    isHighlighted: isSelected)
            }
        }
    
    private var genre: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("장르")
                .font(.musy(weight: .medium, size: 16))
                .foregroundStyle(.white)
            
            FlowLayout(mode: .vstack, items: Music.Genre.allCases, itemSpacing: 4) { genre in
                let isSelected = store.music.genre == genre
                
                tagButton(title: genre.rawValue, isSelected: isSelected) {
                    store.send(.genreTagButtonTapped(genre), animation: .smooth)
                }
                .padding(.bottom, 4)
            }
            .padding(-4)
            .padding(.bottom, -4)
        }
    }
    
    private var intstrument: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("악기")
                .font(.musy(weight: .medium, size: 16))
                .foregroundStyle(.white)
            
            FlowLayout(mode: .vstack, items: Music.Instrument.allCases, itemSpacing: 4) { intstrument in
                let isSelected = store.music.instruments.contains(intstrument)
                
                tagButton(title: intstrument.rawValue, isSelected: isSelected) {
                    store.send(.instrumentTagButtonTapped(intstrument), animation: .smooth)
                }
                .padding(.bottom, 4)
            }
            .padding(-4)
            .padding(.bottom, -4)
        }
    }
    
    private var lengthSelection: some View {
        VStack(spacing: 0) {
            lengthTitle
            
            Spacer()
            
            lengthList
            
            Spacer()
            
            nextButton(title: "선택완료") {
                store.send(.lengthDoneButtonTapped, animation: .smooth)
            }
            .padding(.bottom, 72)
        }
    }
    
    private var lengthTitle: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("길이 선정하기")
                    .font(.musy(weight: .medium, size: 24))
                
                Text("이제 마지막 단계예요, 원하시는 길이를 선정해주세요")
                    .font(.musy(weight: .light, size: 14))
            }
            .foregroundStyle(.white)
            
            Spacer()
        }
    }
    
    private var lengthList: some View {
        VStack {
            Spacer(minLength: 60)
            
            HStack(spacing: 0) {
                Picker("", selection: $minute) {
                    ForEach(1..<10) { minute in
                        Text(String(format: "%02d", minute))
                            .font(.musy(weight: .medium, size: 20))
                            .foregroundStyle(.white)
                    }
                }
                .pickerStyle(.wheel)
                .scaleEffect(2.5)
                .introspect(.picker(style: .wheel), on: .iOS(.v17)) { picker in
                    picker.subviews[1].backgroundColor = UIColor.clear
                }
                .frame(width: 100)
                
                Text(":")
                    .font(.musy(weight: .medium, size: 48))
                    .foregroundStyle(.white)
                
                Picker("", selection: $second) {
                    ForEach(0..<60) { second in
                        Text("\(second)")
                            .font(.musy(weight: .medium, size: 20))
                            .foregroundStyle(.white)
                    }
                }
                .pickerStyle(.wheel)
                .scaleEffect(2.5)
                .introspect(.picker(style: .wheel), on: .iOS(.v17)) { picker in
                    picker.subviews[1].backgroundColor = UIColor.clear
                }
                .frame(width: 100)
            }
            .background {
                VStack(spacing: 72) {
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                .musyRed,
                                .white
                            ]),
                        startPoint: .leading,
                        endPoint: .trailing)
                    .frame(height: 1)
                    
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                .musyRed,
                                .white
                            ]),
                        startPoint: .leading,
                        endPoint: .trailing)
                    .frame(height: 1)
                }
                .padding(.horizontal, 20)
            }
        }
        .frame(height: 260)
        .clipped()
        .padding(.bottom, 60)
    }
    
    @ViewBuilder
    private func nextButton(
        title: String,
        action: @escaping () -> Void) -> some View {
            Button(action: action) {
                Text(title)
                    .font(.musy(weight: .medium, size: 16))
                    .foregroundStyle(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .background {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(.musyRed.opacity(0.82))
                    }
            }
        }
}

#Preview {
    CreateMusicView(store: .init(initialState: .init(), reducer: {
        CreateMusicFeature(reducer: .init({ state, action in
            return .none
        }))
    }))
}
