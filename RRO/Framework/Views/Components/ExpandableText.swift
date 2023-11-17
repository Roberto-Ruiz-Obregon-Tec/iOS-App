//
//  ExpandableText.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 17/11/23.
//

import SwiftUI

struct ExpandableText: View {
    @State var isCollapsed : Bool = true
    let text : String
    let limit : Int
    var body: some View {
        if text.count > limit {
            if isCollapsed {
                Group {
                    (Text(text.prefix(60) + "... ")
                    + Text("Ver mas")
                        .foregroundColor(.gray))
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.2)){
                                isCollapsed = !isCollapsed
                            }
                        }
                }
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding([.top, .bottom])
                        
            } else {
                Group {
                    (Text(text)
                    + Text(" Ver Menos")
                        .foregroundColor(.gray))
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.2)){
                                isCollapsed = !isCollapsed
                            }
                            
                        }
                }
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding([.top, .bottom])
                }
        } else {
            Text(text)
                .frame(maxWidth : .infinity, alignment: .leading)
                .padding([.top, .bottom])
        }
    }
}
