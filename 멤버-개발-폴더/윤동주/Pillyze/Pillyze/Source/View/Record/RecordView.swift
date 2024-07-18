//
//  RecordView.swift
//  Pillyze
//
//  Created by 윤동주 on 7/16/24.
//

import SwiftUI

struct RecordView: View {
    @Binding var isAddSheetShown: Bool
    
    var body: some View {
        VStack {
            Text("Record View")
            Button("완료") {
                self.isAddSheetShown.toggle()
            }
        }
    }
}

#Preview {
    RecordView(isAddSheetShown: .constant(true))
}
