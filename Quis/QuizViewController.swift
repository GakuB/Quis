//
//  QuizViewController.swift
//  Quis
//
//  Created by 馬鳥慎吾 on 2021/01/05.
//

import UIKit
import AVFoundation
class QuizViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    var quizArray = [Any]()
    var correctAnswer: Int = 0
    var timer: Timer?
    var time: Int = 0
    
    
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.timerUpdate), userInfo: nil, repeats: true)
        do {
            let filePath = Bundle.main.path(forResource: "game_maoudamashii_1_battle31",ofType: "mp3")
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
        } catch {
            print("error")
        }
        audioPlayer.play()
        
        quizArray.append(["2020年今年の漢字は？", "蜜", "密", "病", "禍", 2 ])
        quizArray.append(["NiziU,Twiceなどのアーティストを派出したプロデューサーの名前は？", "J.Y.Park", "J.K.Park" , "J.K.Rowling", "パク・ジョンイン", 1])
        quizArray.append(["鬼滅の刃の鬼殺の隊士が使う刀の名前は？", "神楽刀", "鬼殺刀", "日輪刀", "鬼滅刀", 3])
        quizArray.append(["ぺこぱのボケ担当の名前は？？", "松陰寺太郎", "松島太郎", "松中島太勇", "松陰寺太勇", 4 ])
        quizArray.append(["2020年の今年の人に選ばれた人を答えなさい", "ジョーバイデン", "ドナルドランプ", "菅義偉", "ぴろぽん", 1 ])
        quizArray.append(["2019年に活動を開始し、『不可幸力』などのヒット曲をつくり、2021年の飛躍が期待されているアーティストは？", "SEKAI NO OWARI", "Vaundy", "YOASOBI", "King Gnu", 2 ])
        quizArray.append(["2020年に大ヒットした任天堂スイッチのゲーム名は?", "おいでよどうぶつの森", "どびだせどうぶつの森", "あつまれどうぶつの森", "あつもりどうぶつの森", 3 ])
        quizArray.append(["新型コロナウィルスにより疲弊した観光業の活性化をはかるために政府によっておこなわれた事業の名前は？", "新型コロナウイルス", "緊急事態宣言", "go goキャンペーン", "GO TO キャンペーン", 4 ])
        quizArray.append(["3月14日に開業した、東京中心部の鉄道・山手線の新駅は？", "高輪ゲートウェイ駅", "品川ゲートウェイ駅", "芝浜ゲートウェイ駅", "高浜ゲートウェイ駅", 1 ])
        quizArray.append(["次にあげるアーティストのうち、2020紅白歌合戦で最後に歌ったアーティストは誰でしょう？？", "YOSHIKI", "日向坂46", "あいみょん", "嵐", 1 ])
        quizArray.append(["SMBC日本シリーズ、4戦目で福岡ソフトバンクホークスの優勝が決まりましたが、この時の勝利投手の名前は？", "ダルビッシュ有", "菅野智之", "千賀滉大", "松本裕樹", 4 ])
        quizArray.append(["プロ野球で福本豊が1971,1974年に樹立した11試合連続盗塁の記録を塗り替えて世界記録ともなる13試合連続盗塁を決めた選手の名前は？", "イチロー", "周東右京", "大谷翔平", "金子侑司", 2 ])
        quizArray.append(["2020年大活躍したYoutuber芸人で、流行語大賞にもノミネートされた人物の名前は？？", "フワちゃん", "ぺこぱ", "伊沢拓司", "GG佐藤", 1 ])
        quizArray.append(["2020年に発表されたiPhone12の重さは？？", "194g", "133g", "162g", "148g", 3 ])
        quizArray.append(["2020年世界的にヒットし、dynamiteなどの名曲を生み出し続けているBTSのメンバーでAB型なのは誰でしょう？", "キムテヒョン", "ジョングク", "パクジミン", "ミンユンギ", 1 ])
        
        quizArray.shuffle()
        choiceQuiz()
        
    }
    // Do any additional setup after loading the view.
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    func choiceQuiz() {
        let tmpArray = quizArray[0] as! [Any]
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        choiceButton4.setTitle(tmpArray[4] as? String, for: .normal)
    }
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
        
    }
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[5] as! Int == sender.tag {
            
            correctAnswer = correctAnswer + 1
            
            
            
        }
        quizArray.remove(at: 0)
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController; resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    @objc func timerUpdate() {
        print("update")
        time += 1
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        print("invalidate!!")
        self.timer?.invalidate()
    }
    
    
    
    
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


