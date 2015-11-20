//
//  ViewController.swift
//  Silly Song
//
//  Created by Luis Yoshida on 11/20/15.
//  Copyright © 2015 Msen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lyricsTextView: UITextView!
    
    let lyricsTemplate = "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>\n" +
        "Banana Fana Fo F<SHORT_NAME>\n" +
        "Me My Mo M<SHORT_NAME>\n" +
        "<FULL_NAME>"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(sender: AnyObject) {
        lyricsTextView.text = ""
        nameTextField.text = ""
    }
    
    @IBAction func displayLyric(sender: AnyObject) {
        lyricsTextView.text = customizeTemplate(nameTextField.text!, lyricsTemplate: lyricsTemplate)
    }
    
    /**
     Return a lowecase shortname. If the first character is a consonant, it is removed.
     
     - parameter name: String to be converted
     - returns: a lowercase string.
     
     **Example**
     
     * "Talia" returns "alia"
     * "Andrew" returns "andrew"
     */
    func shortNameFromName(name: String) -> String {
        
        if charIsVowel(Character(name[0])) {
            return name[0..<name.characters.count].lowercaseString
        } else {
            return name[1..<name.characters.count]
        }
        
    }
    
    /**
     Checks if a character is a vowel
     
     - parameter char: Character to be checked
     - returns: A Boolean. True if the char is a vowel.
     */
    func charIsVowel(char: Character) -> Bool {
        
        return "aeiou".containsString(String(char).lowercaseString)
        
    }
    
    /**
     Return lyrics by replacing a name in a template.
     
     - parameter fullName: a person's name
     - returns: a string with the name
     */
    func customizeTemplate(fullName: String, lyricsTemplate: String) -> String {
        
        let convertedFullName = fullName.capitalizedString
        let shortName = shortNameFromName(fullName)
        
        let convertedLyrics = lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: convertedFullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
        
        return convertedLyrics
        
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

