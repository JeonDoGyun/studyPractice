//
//  testView.swift
//  iReceipt
//
//  Created by 정유진 on 2022/10/12.
//

//import UIKit
//import SwiftUI
//
//struct MainView: View {
//    
//    
//    @StateObject var imageData = ImageData()
//    @State var showImagePicker: Bool = false
//    
//    var body: some View {
//        NavigationView {
//            
//            
//            VStack {
//                if imageData.imageNote.isEmpty {
//                    Text("사진을 넣어주세요!")
//                        .italic()
//                        .foregroundColor(.gray)
//                } else {
//                    HomeView()
//                }
//            }
//            
//            .navigationTitle("")
//            .sheet(isPresented: $showImagePicker) {
//                
//                ImagePicker(sourceType: .photoLibrary) { image in
//                    imageData.addNote(image: image,
//                                      title: "제목을 입력해주세요!",
//                                      
//                                      desc: "내용을 입력해주세요!")
//                }
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        showImagePicker.toggle()
//                    } label: {
//                        Label("Image", systemImage: "photo.on.rectangle.angled")
//                    }
//                }
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        withAnimation {
//                            imageData.resetUserData()
//                        }
//                    } label: {
//                        Label("Image", systemImage: "trash")
//                    }
//                    .tint(.red)
//                }
//            }
//        }
//        .environmentObject(imageData)
//    }
//}
//
//
//
//
//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
//
