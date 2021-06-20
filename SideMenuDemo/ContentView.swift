//
//  ContentView.swift
//  SideMenuDemo
//
//  Created by Frederick Javalera on 6/20/21.
//

import SwiftUI

struct ContentView: View {
    @State var isDrawerOpen: Bool = false
    
    var body: some View {
        ZStack {
            /// Navigation Bar Title part
            if !self.isDrawerOpen {
                NavigationView {
                    EmptyView()
                        .navigationBarTitle(Text("Navigation Drawer"))
                        .navigationBarItems(leading: Button(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                self.isDrawerOpen.toggle()
                            }
                        }) {
                            Image(systemName: "sidebar.left")
                        })
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
            /// Navigation Drawer part
            NavigationDrawer(isOpen: self.isDrawerOpen)
         /// Other behaviors
        }.background(Color.white)
        .onTapGesture {
            if self.isDrawerOpen {
                self.isDrawerOpen.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct DrawerContent: View {
    var body: some View {
        Color.blue
    }
}

struct NavigationDrawer: View {
    private let width = UIScreen.main.bounds.width + 8
    let isOpen: Bool
    
    var body: some View {
        HStack {
            DrawerContent()
                .frame(width: self.width)
              .offset(x: self.isOpen ? self.width/2 : self.width)
                .animation(.default)
            Spacer()
        }
    }
}
