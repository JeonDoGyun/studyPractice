//
//  NoteDetailView.swift
//  iReceipt
//
//  Created by Federico on 26/01/2022.
//

import SwiftUI

struct NoteDetailView: View {
    @EnvironmentObject var imageData : ImageData
    @State var note: ImageNote
    @State var showImagePicker: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Form {
            
            Section {
                
                
                HStack {
                    Spacer()
                    Image(uiImage: UIImage(data: note.image)!)
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Spacer()
                }
                
                TextField("글을 작성해주세요!", text: $note.title)
                    .textSelection(.enabled)
                    .onTapGesture {
                        note.title = ""
                    }
                
                ZStack {
                    TextEditor(text: $note.description)
                        .textSelection(.enabled)
                        .frame(height: 200)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(note.description.count)/120")
                                .foregroundColor(.gray)
                                .padding()
                        }
                        
                    }
                }
                HStack {
                    Spacer()
                    Button("저장하기") {
                        imageData.editNote(id: note.id, title: note.title, description: note.description)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                } //여기서 부터 저장
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Label("Image", systemImage: "photo.on.rectangle.angled")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            imageData.resetUserData()
                        }
                    } label: {
                        Label("Image", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        }
    }
    
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let tempImage = UIImage(systemName: "map")?.pngData()
        
        NoteDetailView(note: ImageNote(id: UUID(), image: tempImage!, title: "Test", description: "Test Description"))
            .environmentObject(ImageData())
    }
}
