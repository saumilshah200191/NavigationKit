//
//  Dismiss.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
struct Dismiss: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

@available(iOS 13.0, *)
struct DismissToRoot: ViewModifier {
    
    @EnvironmentObject var navigation: Navigation
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            navigation.isPushRootActive = false
        }
    }
}

@available(iOS 13.0, *)
struct DismissNavigationViewSheet: ViewModifier {
    
    @Environment(\.showingSheet) var showingSheet
    
    func body(content: Content) -> some View {
        content.onTapGesture {
            showingSheet?.wrappedValue = false
        }
    }
}
