//
//  InicioView.swift
//  RRO
//
//  Created by sebastian Jimenez Bauer on 30/10/23.
//

import Foundation
import SwiftUI

struct InicioView: View {
    @State var currentTab: Int = 0
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack(alignment: .top){
            TabView(selection: self.$currentTab){
                CoursesView().tag(0)
                ScholarshipsView().tag(1)
                ProgramListView().tag(2)
                CertificationListView().tag(3)
            }
            .padding(.top, 180)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            TabBarView(currentTab: self.$currentTab)
        }
    }
}



struct TabBarView: View {
    var tabVarList:[String] = ["Cursos", "Becas","Programas" ,"Certificaciónes"]
    @Binding var currentTab : Int
    
    var body: some View {
        VStack{
            Text("Inicio").padding(.horizontal).foregroundColor(Color.black).font(.title).bold()
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(Array(zip(self.tabVarList.indices, self.tabVarList)),id: \.0) { index, name in
                        TabBarItem(tabBarItemName: name, currentTab: self.$currentTab, Tab: index)
                    }
                }
            }
        }
        .frame(height: 180)
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
}


struct TabBarItem: View {
    var tabBarItemName: String

    @Binding var currentTab: Int
    var Tab: Int

    var body: some View {
        Button(action: {
            self.currentTab = Tab
        }) {
            Text(tabBarItemName)
                .lineLimit(1)
                .bold(true)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .foregroundColor(self.currentTab == Tab ? .white : .primary)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(self.currentTab == Tab ? Color.red : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.systemGray4), lineWidth: 1.5)
                        )
                )
                .buttonStyle(.borderedProminent)
        }
        .colorScheme(self.currentTab == Tab ? .dark : .light)
    }
}


struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView()
    }
}
