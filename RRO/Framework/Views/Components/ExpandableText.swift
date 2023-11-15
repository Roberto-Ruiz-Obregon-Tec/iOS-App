//
//  ExpandableText.swift
//  RRO
//
//  Created by Armando Rosas Balderas on 15/11/23.
//

import SwiftUI
import ExpandableText

struct ExpandableText: View {
    let text : String
    var body: some View {
        ExpandableText(text: text)
            .font(.body)//optional
            .foregroundColor(.primary)//optional
            .lineLimit(2)//optional
            .padding(.horizontal, 24)//optional
    }
}
