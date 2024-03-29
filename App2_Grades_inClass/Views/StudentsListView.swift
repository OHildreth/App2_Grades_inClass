//
//  StudentsListView.swift
//  App2_Grades_inClass
//
//  Created by Owen Hildreth on 2/12/24.
//

import SwiftUI

struct StudentsListView: View {
    @Binding var students: [Student]
    
    
    var body: some View {
        List($students) { $nextStudent in
            HStack {
                Text(nextStudent.name)
                Spacer()
                Text(nextStudent.studentID)
                Spacer()
                Text("Score:")
                TextField("Score", value: $nextStudent.overAllScore, format: .number)
            }
            
        }
    }
}

