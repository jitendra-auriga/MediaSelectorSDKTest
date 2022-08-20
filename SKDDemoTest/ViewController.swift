//
//  ViewController.swift
//  SKDDemoTest
//
//  Created by mac on 2022-08-17.
//

import UIKit
import MediaSelector
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var imgPreview: UIImageView!
    
    @IBOutlet weak var swAllowCropping: UISwitch!
    @IBOutlet weak var swAllowSettingsNavigations: UISwitch!
    
    var selectedVideoPath: URL?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPlay.setTitle("", for: .normal)
                
    }


    
    
    @IBAction func showAllOptions(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, allowCrop: swAllowCropping.isOn, allowSettingsNavigation: swAllowSettingsNavigations.isOn) { image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                
                if videoUrl != nil {
                    self.btnPlay.isHidden = false
                    self.selectedVideoPath = videoUrl
                }
            }
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .image, allowCrop: swAllowCropping.isOn, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = true
                self.selectedVideoPath = nil
            }
        }
    }
    
    @IBAction func selectVideo(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .video, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = false
                self.selectedVideoPath = videoUrl
                
            }
        }
    }
    
    @IBAction func selectImageFromPhotos(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .image, source: .gallery, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = true
                self.selectedVideoPath = nil
            }
        }
    }
    
    @IBAction func selectImageFromCamera(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .image, source: .camera, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = true
                self.selectedVideoPath = nil
            }
        }
    }
    
    @IBAction func selectVideoFromPhotos(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .video, source: .gallery, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = false
                self.selectedVideoPath = videoUrl
            }
        }
    }
    
    @IBAction func selectVideoFromCamera(_ sender: Any) {
        MediaPickerManager.shared.pickMedia(self, mediaType: .video, source: .camera, allowSettingsNavigation: swAllowSettingsNavigations.isOn) {image, videoUrl in
            DispatchQueue.main.async {
                self.imgPreview.image = image
                self.btnPlay.isHidden = false
                self.selectedVideoPath = videoUrl
            }
        }
    }
    
    @IBAction func playVideo(_ sender: Any) {
        if selectedVideoPath != nil {
            let player = AVPlayer(url: URL(fileURLWithPath: selectedVideoPath!.path))
            let playerController = AVPlayerViewController()
            playerController.player = player
            self.present(playerController, animated: true)
        }
    }
    
}

