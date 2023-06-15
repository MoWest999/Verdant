//
//  AllDataView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/20/23.
//

import SwiftUI

struct AllDataView: View {
    
    @ObservedObject var data = TrackerData()
    @State var presentPopupAllData = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (data.compostDataCollection, id: \.self) {compost in
                    HStack {
                        Text(compost)
                        Spacer()
                        Text(data.formattedDate)
                    }
                }
                .onDelete { offsets in
                    data.compostDataCollection.remove(atOffsets: offsets)
                }
            }
        Spacer()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentPopupAllData = false
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }

    }    }
}

struct AllDataView_Previews: PreviewProvider {
    static var previews: some View {
        AllDataView()
    }
}
