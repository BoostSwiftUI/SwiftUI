//
//  View+cornerRadius.swift
//  BoostPillyze
//
//  Created by 유정주 on 7/13/24.
//

import SwiftUI

extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// MARK: - RoundedCorner

struct RoundedCorner: Shape {
    
    // MARK: - Interface
    
    func path(in rect: CGRect) -> Path {
        let cornerRadii = CGSize(width: radius, height: radius)
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: cornerRadii)
        return Path(path.cgPath)
    }
    
    // MARK: - Attribute
    
    private let radius: CGFloat
    private let corners: UIRectCorner

    // MARK: - Initializer
    
    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
}
