//
//  color.swift
//  burst-ui
//
//  Created by Shubham Lahoti on 22/09/23.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
    let imageBackground = Color("ImageBackground")
    let barColor = Color("barColor")
}
