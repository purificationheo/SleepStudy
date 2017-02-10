//
//  RecordViewController.swift
//  SleepStudy
//
//  Created by cscoi011 on 2017. 1. 31..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController, AVAudioRecorderDelegate  {
    
    var recordButton: UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        // failed to record!
                    }
                }
            }
        } catch {
            // failed to record!
        }
        // Do any additional setup after loading the view.
    }
    func loadRecordingUI() {
        recordButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 32))
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    func startRecording() {
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier:NSCalendar.Identifier(rawValue: NSGregorianCalendar))!
        let comps = cal.components([.year, .month, .day], from:now as Date)

        let filename = (curClass?.name)! + comps.description + ".m4a"
        print(filename)
        let audioFilename = getDocumentsDirectory().appendingPathComponent("record/" + filename)
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            
            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    func recordTapped() {
        if audioRecorder == nil {
            let filemgrCreate = FileManager.default
            let dirPathsCreate = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true)
            let docsDirCreate = dirPathsCreate[0] as String
            let newDirCreate = docsDirCreate.appending("/record")
            print("[5] 디렉토리 생성전 DirectoryPath : \(docsDirCreate)")
            print("[5] New directory path : \(newDirCreate)")
            do {
                try filemgrCreate.createDirectory(atPath: newDirCreate, withIntermediateDirectories: true, attributes:nil)
            } catch {
                print("[5] Failed to create dir!!")
                print(error)
            }
            startRecording()
        } else {
            finishRecording(success: true)
            let filemgrList = FileManager.default
            do{
                let fpath = String(describing: getDocumentsDirectory())
                let index = fpath.index(fpath.startIndex, offsetBy: 7)
                let filelist = try filemgrList.contentsOfDirectory(atPath: fpath.substring(from: index).appending("record"))
                for filename in filelist {
                    print("[4] \(filename)")
                }
            }catch{
                print("[4] 디렉토리 리스팅 실패!!")
            }
        }
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
