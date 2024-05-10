//
//  LinearGradient+Extension.swift
//  SharedDesignSystem
//
//  Created by 김도형 on 5/2/24.
//

import SwiftUI

public extension LinearGradient {
    static let musyDark = LinearGradient(
        gradient: Gradient(
            colors: [
                Color(red: 0.03, green: 0, blue: 0.20),
                Color(red: 0.56, green: 0, blue: 1)
            ]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let musyMedium = LinearGradient(
        gradient: Gradient(
            colors: [
                Color(red: 0.03, green: 0, blue: 0.20),
                Color(red: 0.56, green: 0, blue: 1),
                Color(red: 0.64, green: 0.11, blue: 0.89),
                Color(red: 0.86, green: 0.44, blue: 0.56)
            ]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let musyBright = LinearGradient(
        gradient: Gradient(
            colors: [
                Color(red: 0.86, green: 0.44, blue: 0.56),
                Color(red: 0.64, green: 0.11, blue: 0.89),
                Color(red: 0.03, green: 0, blue: 0.20)
            ]),
        startPoint: .top,
        endPoint: .bottom)
}
