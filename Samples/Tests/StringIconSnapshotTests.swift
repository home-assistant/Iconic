//
//  StringIconSnapshotTests.swift
//  Iconic
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

class StringIconSnapshotTests: BaseSnapshotTestCase {

    override func setUp() {
        super.setUp()

        // Toggle on for recording a new snapshot. Remember to turn it back off to validate the test.
        self.recordMode = false
    }

    func testSimpleString() {

        let string = FontAwesomeIcon.cameraRetroIcon.attributedString(ofSize: 50, color: nil)
        let textView = UITextView()

        textView.attributedText = string
        textView.sizeToFit()

        self.verifyView(textView, withIdentifier: "")
    }

    func testFullIconMap() {

        var rect = CGRect(x: 0, y: 0, width: 500, height: 0)
        let attributedString = NSAttributedString.iconMap(withSize: 20, spacing: 5, andColor: nil)

        let textView = UITextView(frame: rect)
        textView.attributedText = attributedString

        rect.size.height = textView.contentSize.height
        textView.frame = rect

        self.verifyView(textView, withIdentifier: "")
    }

    func testComposeString() {

        let icon = FontAwesomeIcon.dribbleIcon

        let edgeInsets = ["left": UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15),
                          "bottom": UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0),
                          "right": UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0),
                          "top": UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)]

        for (kind, edgeInset) in edgeInsets {

            let attributedText = NSMutableAttributedString()
            let iconString = icon.attributedString(ofSize: 25, color: nil, edgeInsets: edgeInset)

            let titleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25),
                                   NSAttributedString.Key.foregroundColor: UIColor.black]

            let titleAttrString = NSAttributedString(string: icon.name, attributes: titleAttributes)

            attributedText.append(iconString)
            attributedText.append(titleAttrString)

            let textView = UITextView()

            textView.attributedText = attributedText
            textView.sizeToFit()

            self.verifyView(textView, withIdentifier: kind)
        }
    }
}
