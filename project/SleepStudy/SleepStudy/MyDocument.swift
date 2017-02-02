//
//  MyDocument.swift
//  SleepStudy
//
//  Created by cscoi010 on 2017. 2. 2..
//  Copyright © 2017년 KKUMA. All rights reserved.
//

import UIKit

class MyDocument: UIDocument {
    
    var userText: String? = "Sample Text"
    
    /*
     MyDocument의 인스턴스가 생성될때와 애플리케이션의 데이터를 파일로 저장하기 위해 인스턴스의 메서드가 호출될때, 클래스는 contentsForType 인스턴스 메서드를 호출, 이 메서드는 문서의 데이터를 수집하여 NSData 객체의 형태로 MyDocument 객체의 인스턴스에게 전달한다. 그리고 NSData 객체의 내용은 문서로 쓰여진다. 실제로는 userText에서 현재 값을 얻어 NSData객체에 넣고 반환하는 것이다.
     */
    func contentsForType(typeName: String) throws -> AnyObject {
        if let content = userText{
            let length = content.lengthOfBytes(using: String.Encoding.utf8)
            return NSData(bytes: content, length: length)
        }else{
            return NSData()
        }
    }
    
    /*
     MyDocument 인스턴스가 파일에서 내용을 읽어올때 loadFromContents 인스턴스 메서드가 호출된다. 이 메서드는 문서의 내용이 담겨 있는 NSData 객체를 넘겨받으며, 이에 해당하는 애플리케이션의 내부 데이터 구조를 업데이트하는 역할을 한다. 그러므로 이 메서드가 할일은 NSData 객체의 내용을 문자열로 변환하고 이를 userText 객체에 할당하는 것이다.
     */
    func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
        if let userContent = contents as? NSData{
            // Swift under 2.0
            //            userText = String(bytes: contents.bytes,
            //                length:userContent.length,
            //                encoding: NSUTF8StringEncoding)
            // Swift after 2.0
            userText = String(data:userContent as Data, encoding:String.Encoding.utf8)!
            print("MyDocument loadFromContents => UserText : \(userText)")
        }
    }

}
