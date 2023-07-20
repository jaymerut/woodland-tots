//
//  FontHelper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

public class FontHelper {
    
    public static func fontHelvetica(_ size: CGFloat) -> Font {
        return .custom("Helvetica", size: size)
    }
    public static func fontHelveticaBold(_ size: CGFloat) -> Font {
        return .custom("Helvetica Bold", size: size)
    }
    public static func fontHelveticaNeueItalic(_ size: CGFloat) -> Font {
        return .custom("Helvetica Neue Italic", size: size)
    }
}
