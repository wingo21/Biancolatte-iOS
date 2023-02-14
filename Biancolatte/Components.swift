//
//  Components.swift
//  Biancolatte
//
//  Created by Alessandro Zanin on 14/02/23.
//

import Foundation
import SwiftUI

class Components {

}

// Select which font to use
func getFont(size: CGFloat, font: Int) -> Font {
    // Ultra Thic
    if font == 1 {
        return Font.custom("MADEOuterSans-Black", size: size)
    }
    // Thic
    else if font == 2 {
        return Font.custom("MADEOuterSans-Bold", size: size)
    }
    // Subtitle
    else if font == 3 {
        return Font.custom("MADEOuterSans-Light", size: size)
    }
    // Title
    else if font == 4 {
        return Font.custom("MADEOuterSans-Medium", size: size)
    }
    // Regular
    else if font == 5 {
        return Font.custom("MADEOuterSans", size: size)
    }
    // Standard
    return Font.custom("MADEOuterSans-Thin", size: size)
}

// This are the function to use on Text to apply the fonts
extension Text {
    
    func ultraThic() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 1))
        }
    
    func thic() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 2))
        }
    
    func subtitle() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 3))
        }
    
    func title() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 4))
        }
    
    func regular() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 5))
        }
    
    func standard() -> some View {
        self.foregroundColor(Color("SecondaryColor"))
        .font(getFont(size: 25, font: 0))
        }
}

// This allows us to swith between dark and light version of images, such as logos and writings throught the app
struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light.resizable()
                .scaledToFit()
        } else {
            dark.resizable()
                .scaledToFit()
        }
    }
}

