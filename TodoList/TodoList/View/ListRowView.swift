//
//  ListRowView.swift
//  TodoList
//
//  Created by ayushman.soni on 14/01/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    var item1 = ItemModel(title: "First item!", isCompleted: false)
    let item2 = ItemModel(title: "Second Item!", isCompleted: true)
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
