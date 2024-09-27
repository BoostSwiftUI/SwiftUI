//
//  CapturePhoto.swift
//  Pillyze
//
//  Created by 권승용 on 9/17/24.
//

import SwiftUI
import UIKit

struct CapturePhoto: View {
    @State private var selectedImage: UIImage? = nil
    @State private var showCameraView: Bool = false
    
    var body: some View {
        if selectedImage == nil {
            Rectangle()
                .frame(maxWidth: .infinity)
                .aspectRatio(1.7, contentMode: .fill)
                .opacity(0)
                .overlay {
                    Image(.plus)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
                .onTapGesture {
                    showCameraView = true
                }
                .sheet(isPresented: $showCameraView) {
                    CameraView(selectedImage: $selectedImage)
                }
        } else {
            Image(uiImage: selectedImage!)
                .resizable()
                .scaledToFill()
                .aspectRatio(1.7, contentMode: .fit)
                .onTapGesture {
                    showCameraView = true
                }
                .sheet(isPresented: $showCameraView) {
                    CameraView(selectedImage: $selectedImage)
                }
        }
    }
}

private struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_: UIImagePickerController, context _: UIViewControllerRepresentableContext<CameraView>) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        private let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
    }
}

#Preview {
    CapturePhoto()
}
