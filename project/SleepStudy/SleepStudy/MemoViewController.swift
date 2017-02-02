//
//  MemoViewController.swift
//  SleepStudy
//
//  Created by cscoi010 on 2017. 2. 1..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit
import Foundation



class MemoViewController: UIViewController {

    let filemgr = FileManager.default
    let fileHandleTempPath = "/tmp/temptext.txt"
    
    @IBAction func Load(_ sender: Any) {
        
        let fileTempRead:FileHandle? = FileHandle(forReadingAtPath: fileHandleTempPath)
        if fileTempRead == nil {
            print("[8] File읽기 open failed!!")
        }else{
            fileTempRead?.seek(toFileOffset: 5)
            let databuffer = fileTempRead?.readData(ofLength: 5)
            fileTempRead?.closeFile()
            print("[8] File읽기 buffer => \(databuffer)")
            
            
    }

    }
    
    @IBAction func SaveMemo(_ sender: Any) {
        
        let fileHandlePath = "/tmp/filehandle1.txt"
        if filemgr.createFile(atPath: fileHandlePath, contents: nil, attributes:nil) {
            print("[7] filePathToCopy 파일 생성 완료!")
        }else{
            print("[7] filePathToCopy 파일 생성 실패!")
        }
        
        let file:FileHandle? = FileHandle(forReadingAtPath: fileHandlePath)
        if file == nil {
            print("[7] File open failed!!")
        }else{
            print("[7] Offset = \(file?.offsetInFile)")
            file?.seekToEndOfFile()
            print("[7] Offset = \(file?.offsetInFile)")
            file?.seek(toFileOffset: 30)
            print("[7] Offset = \(file?.offsetInFile)")
            file?.closeFile()
        }
        
    }

}

    /*
        super.viewDidLoad()
        
        let filemgr = FileManager.default
        
        
        // 현재 작업 디렉토리 확인
        let currentPath = filemgr.currentDirectoryPath
        print("[1] Current Directory : \(currentPath)")
        
        
        
        // 현재 애플리케이션의 Documents 디렉토리 얻기
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0] as String
        print("[2] Documents Directory : \(docsDir)")
        
        
        
        // 임시 디렉토리 확인
        let tmpDir = NSTemporaryDirectory() as String
        print("[3] Temporary Directory : \(tmpDir)")
        
        
        
        // 디렉토리 변경
        let filemgrChange = FileManager.default
        let dirPathsChange = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDirChange = dirPathsChange[0] as String
        if filemgrChange.changeCurrentDirectoryPath(docsDirChange) {
            // 성공
            print("[4] 작업중인 디렉토리 변경을 성공하였습니다.!!!")
            print("[4] 변경 디렉토리 Path : \(docsDirChange)")
        }else{
            // 실패
            print("[4] 작업중인 디렉토리 변경을 실패하였습니다.!!!")
        }
        
        let fileManager = FileManager.default
            
            // Create 'subfolder' directory
            
         do {
            try fileManager.createDirectory(atPath: "subfolder", withIntermediateDirectories: true, attributes: nil)
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }
    
        // 디렉토리 삭제
            do {
                try fileManager.removeItem(atPath: "subfolder")
            }
            catch let error as NSError {
                print("Ooops! Something went wrong: \(error)")
            }
            
        
        // 디렉토리의 내용 나열
        let filemgrList = FileManager.default
        do{
            let filelist = try filemgrList.contentsOfDirectory(atPath: "/")
            for filename in filelist {
                print("[7] \(filename)")
            }
        }catch{
            print("[7] 디렉토리 리스팅 실패!!")
        }
        
        
        // 파일 또는 디렉토리의 속성(/Applications 디렉토리의 파일 타입 추출)
        let filemgrProperty = FileManager.default
        do{
            let attribs:NSDictionary? = try filemgrProperty.attributesOfItem(atPath: "/Applications") as NSDictionary?
            if let fileattribs = attribs {
                let type = fileattribs["NSFileType"] as! String
                print("[8] File Type \(type)")
            }
        }catch{
            print("[8] 파일 및 디렉토리 속성 출력 실패!!!")
        }
    }        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

        // [0] NSFileManager 인스턴스 생성
        let filemgr = FileManager.default
        
        
        // [1] 파일 존재 여부 확인
        if filemgr.fileExists(atPath: "/Applications") {
            print("[1] File exists")
        }else{
            print("[1] File not found!!")
        }
        
        
        
        // [2] 2개의 파일 내용 비교
        let filepath1 = "/tmp/testfile1.txt"
        let filepath2 = "/tmp/testfile2.txt"
        if filemgr.createFile(atPath: filepath1, contents: nil, attributes:nil) {
            print("[2] filepath1 파일 생성 완료!")
        }else{
            print("[2] filepath1 파일 생성 실패!")
        }
        if filemgr.createFile(atPath: filepath2, contents: nil, attributes:nil) {
            print("[2] filepath2 파일 생성 완료!")
        }else{
            print("[2] filepath2 파일 생성 실패!")
        }
        // 디렉토리의 내용 나열
        let filemgrList = FileManager.default
        do{
            let filelist = try filemgrList.contentsOfDirectory(atPath: "/tmp")
            for filename in filelist {
                print("[2] \(filename)")
            }
        }catch{
            print("[2] 디렉토리 리스팅 실패!!")
        }
        
        // 2개의 파일 내용 비교
        if filemgr.contentsEqual(atPath: filepath1, andPath: filepath2) {
            print("[2] File contents match!!")
        }else{
            print("[2] File contents do not match!!!")
        }
        
        
        
        
        // [3] 파일의 읽기가능/쓰기가능/실행가능/삭제가능 상태 확인
        // isReadableFileAtPath
        // isWritableFileAtPath
        // isExecutableFileAtPath
        // isDeletableFileAtPath
        if filemgr.isWritableFile(atPath: filepath1){
            print("[3] File is writable")
        }else{
            print("[3] File is read-only")
        }
        
        
        // [4] 파일 옮기기와 이름 바꾸기
        let moveFilePath = "/tmp/newMove"
        do{
            // 기존 파일 삭제 처리
            let checkFile = moveFilePath + "/testfile1.txt"
            print("[4] 기존파일 존재여부 체크 => \(checkFile)")
            if filemgr.fileExists(atPath: checkFile) {
                print("[4] 기존파일 존재!!")
                try filemgr.removeItem(atPath: checkFile)
            }else{
                print("[4] 기존파일 없음!!")
            }
            
            // 파일 옮기기
            try filemgr.moveItem(atPath: filepath1, toPath:moveFilePath)
            
            // 디렉토리의 내용 나열
            let filemgrList = FileManager.default
            do{
                let filelist = try filemgrList.contentsOfDirectory(atPath: "/tmp/newMove")
                for filename in filelist {
                    print("[4] \(filename)")
                }
            }catch{
                print("[4] 디렉토리 리스팅 실패!!")
            }
            print("[4] File movement is SUCCESSFUL!!")
        }catch{
            print("[4] File movement is failed!!!! \(error)")
        }
        
        
        
        // [5] 파일 복사하기
        let filePathToCopy = "/tmp/haha1.txt"
        let fileCopyPath = "/tmp/copy"
        let fileCopyPathFull = "/tmp/copy/haha1.txt"
        
        // 기존 파일 삭제 처리
        if filemgr.fileExists(atPath: fileCopyPathFull) {
            print("[5] 기존파일 존재!!")
            do{
                try filemgr.removeItem(atPath: fileCopyPathFull)
                print("[5] 기존파일삭제성공!!")
            }catch{
                print("[5] 기존파일삭제실패!! Error => \(error)")
            }
        }else{
            print("[5] 기존파일 없음!!")
        }
        
        // 복사전 파일 생성
        if filemgr.createFile(atPath: filePathToCopy, contents: nil, attributes:nil) {
            print("[5] filePathToCopy 파일 생성 완료!")
        }else{
            print("[5] filePathToCopy 파일 생성 실패!")
        }
        
        // 파일 복사
        do{
            try filemgr.copyItem(atPath: filePathToCopy, toPath: fileCopyPath)
            print("[5] 파일 복사 성공!")
        }catch{
            print("[5] 파일 복사 실패! Error => \(error)")
        }
        
        
        // [6] 심볼릭 링크 생성
        do{
            try filemgr.createSymbolicLink(atPath: filepath2, withDestinationPath: filepath1)
            print("[6] Link successful!!")
        }catch{
            print("[6] Link failed!! Error => \(error)")
        }
        
        
        //=====================================
        /*
        
        // [7] NSFileHandle 이용하여 파일 처리
        // 파일 생성
        let fileHandlePath = "/tmp/filehandle1.txt"
        if filemgr.createFile(atPath: fileHandlePath, contents: nil, attributes:nil) {
            print("[7] filePathToCopy 파일 생성 완료!")
        }else{
            print("[7] filePathToCopy 파일 생성 실패!")
        }
        
        let file:FileHandle? = FileHandle(forReadingAtPath: fileHandlePath)
        if file == nil {
            print("[7] File open failed!!")
        }else{
            print("[7] Offset = \(file?.offsetInFile)")
            file?.seekToEndOfFile()
            print("[7] Offset = \(file?.offsetInFile)")
            file?.seek(toFileOffset: 30)
            print("[7] Offset = \(file?.offsetInFile)")
            file?.closeFile()
        }
        */
        //=====================================
        
        // [8] NSFileHandle 이용하여 파일에 데이터 쓰고 읽기
        // 파일에 데이터 쓰기
        let fileHandleTempPath = "/tmp/temptext.txt"
        let fileTemp:FileHandle? = FileHandle(forWritingAtPath: fileHandleTempPath)
        if fileTemp == nil {
            print("[8] File쓰기  open failed!!")
        }else{
            let data = ("black dog! what the heck r u doing?" as NSString).data(using: String.Encoding.utf8.rawValue)
            fileTemp?.seek(toFileOffset: 10)
            fileTemp?.write(data!)
            fileTemp?.closeFile()
            print("[8] File쓰기 SUCCEESS!!")
        }
        
        // 파일에 데이터 읽기
        let fileTempRead:FileHandle? = FileHandle(forReadingAtPath: fileHandleTempPath)
        if fileTempRead == nil {
            print("[8] File읽기 open failed!!")
        }else{
            fileTempRead?.seek(toFileOffset: 5)
            let databuffer = fileTempRead?.readData(ofLength: 5)
            fileTempRead?.closeFile()
            print("[8] File읽기 buffer => \(databuffer)")
        }
    }
    
    var document: MyDocument?
    var documentURL: NSURL?
    
    @IBOutlet weak var textView: UITextView!
    
    
    }

/*
import Foundation

class File: NSCoding, NSObject {
    
    
 
 func exists (path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    
 func read (path: String, encoding: String.Encoding = String.Encoding.utf8) -> String? {
        if File.exists(path: path) {
            return String.stringWithContentsOfFile(path, encoding: encoding, error: nil)!
        }
        
        return nil
    }
    
 func write (path: String, content: String, encoding: String.Encoding = String.Encoding.utf8) -> Bool {
        return content.write(toFile: path, atomically: true, encoding: encoding)
    }
}

let read : String? = File.read(path: "/path/to/file.txt")


print("\(File.read)")

let write : Bool = File.write(path: "/path/to/file2.txt", content: "String to write")

print(write)



*/
class File: NSObject, NSCoding {
    
    let date:String
    var subjects:[Subject]?
    
    
    init(name:String) {
        self.date = name
    }
    
    required init?(coder aDecoderL: NSCoder){
        self.date = aDecoderL.decodeObject(forKey: "date") as! String
        self.subjects = aDecoderL.decodeObject(forKey: " subjects") as? [Subject]
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.date, forKey:"date")
        aCoder.encode(self.subjects, forKey: "subjects")
    
    }

}
    
/*
    func exists (path: String) -> Bool {
        return FileManager().fileExists(atPath: path)
    }
    
    func read (path: String, encoding: String.Encoding = String.Encoding.utf8) -> String? {
        if Subject.exists(path: path) {
            return String.stringWithContentsOfSubject(path, encoding: encoding, error: nil)!
        }
        
        return nil
    }
    
    func write (path: String, content: String, encoding: String.Encoding = String.Encoding.utf8) -> Bool {
        return content.write(toFile: path, atomically: true, encoding: encoding)
    }
}

let read : String? = File.read(path: "/path/to/file.txt")


print("\(File.read)")

let write : Bool = File.write(path: "/path/to/file2.txt", content: "String to write")

print(write)

}
 */


*/
