//
//  View+.swift
//  
//
//  Created by Alex Nagy on 14.12.2020.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {
    
    public func rootable(_ navigation: Navigation = Navigation()) -> some View {
        modifier(Rootable(navigation: navigation))
    }
    
    public func pushes<Destination: View>(_ destination: Destination) -> some View {
        modifier(Push(destination: {
            destination
        }, isActive: false))
    }
    
    public func pushesAsRoot<Destination: View>(_ destination: Destination) -> some View {
        modifier(PushAsRoot(destination: {
            destination
        }))
    }
    
    public func dismisses() -> some View {
        modifier(Dismiss())
    }
    
    public func dismissesToRoot() -> some View {
        modifier(DismissToRoot())
    }
    
    public func dismissesNavigationViewSheet() -> some View {
        return modifier(DismissNavigationViewSheet())
    }
    
    public func presents<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(Present(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, isPresented: false))
    }
    
    public func presents<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true, onDismiss: (() -> Void)?) -> some View {
        modifier(PresentOnDismiss(destination: {
            destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
        }, onDismiss: onDismiss, isPresented: false))
    }
    
    public func presentsNavigationView<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true) -> some View {
        modifier(PresentNavigationView(destination: {
            NavigationView {
                destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
            }
        }, isPresented: false))
    }
    
    public func presentsNavigationView<Destination: View>(_ destination: Destination, allowsSwipeToDismiss: Bool = true, onDismiss: (() -> Void)?) -> some View {
        modifier(PresentNavigationViewOnDismiss(destination: {
            NavigationView {
                destination.allowsSwipeToDismiss(allowsSwipeToDismiss)
            }
        }, onDismiss: onDismiss, isPresented: false))
    }
}
