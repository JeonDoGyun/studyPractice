//
//  addDiaryView.swift
//  iReceipt
//
//  Created by 정유진 on 2022/10/12.
//

//import SwiftUI
//
//struct addDiaryView: View {
//    
//    @State private var showSheet: Bool = false
//    @State private var showImagePicker: Bool = false
//    @State private var sourceType: UIImagePickerController.SourceType = .camera
//    
//    
//    
//    
//    @State private var image: UIImage?
//    
//    var body: some View {
//        
//        
//        NavigationView {
//            
//            VStack {
//                
//                Image(uiImage: image ?? UIImage(named: "camera")!)
//                    .resizable()
//                    .frame(width: 300, height: 300)
//                    .offset(y: -100)
//                
//                Button("Choose Picture") {
//                    
//                    self.showSheet = true
//                        
//                }.padding()
//                    .actionSheet(isPresented: $showSheet) {
//                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
//                            .default(Text("Photo Library")) {
//                                self.showImagePicker = true
//                                self.sourceType = .photoLibrary
//                            },
//                            .default(Text("Camera")) {
//                                self.showImagePicker = true
//                                self.sourceType = .camera
//                            },
//                            .cancel()
//                        ])
//                }
//                
//            }
//                
//                
//            .navigationBarTitle("Camera Demo")
//            
//        }.sheet(isPresented: $showImagePicker) {
//            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
//        }
//    }
//}
//
//struct addDiaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        addDiaryView()
//    }
//}
