//
//  Font+Extenstion.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/10/24.
//

import SwiftUI

public extension Font {
    static func musy(weight: MusyFont, size: CGFloat) -> Font {
        switch weight {
        case .bold:
            return SharedDesignSystemFontFamily.GmarketSansTTF.bold.swiftUIFont(size: size)
        case .light:
            return SharedDesignSystemFontFamily.GmarketSansTTF.light.swiftUIFont(size: size)
        case .medium:
            return SharedDesignSystemFontFamily.GmarketSansTTF.medium.swiftUIFont(size: size)
        }
    }
}
