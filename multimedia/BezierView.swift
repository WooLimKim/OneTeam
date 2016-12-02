//
//  BezierView.swift
//  multimedia
//
//  Created by iMac05 on 2016. 11. 22..
//  Copyright © 2016년 iMac05. All rights reserved.
//  멀티미디어 공학과 2011112915 김우림

import UIKit
import QuartzCore

class BezierView: UIView {
    

//    let animation:CAKeyframeAnimation
    override func draw(_ rect: CGRect) {
        
        
        var str = "Hello, playground"
        
        let player = 4
        let fild = player*2-1
        let n = 8
        let m = 8
        var ​emptyArray2​: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        
        func RandomSadari() -> Int
        {
            let random = Int(arc4random_uniform(2)) //1 or 0
            return random
        }

        func InitSadari()
        {
            for i in 0..<fild
            {
                for j in 0..<m
                {
                    if(i%2 == 0)
                    {
                        ​emptyArray2​[i][j] = 1
                    }
                }
            }
        }
        
        func MackSadari()
        {
            var temp = 0
            for i in 0..<fild
            {
                for j in 0..<m{
                    if(i%2 == 1)
                    {
                        if(i == 1)
                        {
                            temp = RandomSadari()
                            ​emptyArray2​[i][j] = temp
                        }
                        else
                        {
                            if(​emptyArray2​[i-2][j] == 0)
                            {
                                temp = RandomSadari()
                                ​emptyArray2​[i][j] = temp
                            }
                        }
                        
                    }
                }
            }
        }
        InitSadari()
        MackSadari()
        
   
        
        self.backgroundColor = UIColor.white
        
        var path1 = UIBezierPath()
           var path2 = UIBezierPath()
           var path3 = UIBezierPath()
           var path4 = UIBezierPath()
            var path5 = UIBezierPath()
        var path:Array<UIBezierPath> = [UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath(),UIBezierPath()]
     
        
        

            var AnswerPath = UIBezierPath()
        
  
 

        
        path1.move(to: CGPoint(x:100, y: 100))

        path2.move(to: CGPoint(x: 100, y: 100))
        path2.addLine(to: CGPoint(x:100,y:550))
  
        path3.move(to: CGPoint(x: 150, y: 100))
        path3.addLine(to: CGPoint(x:150,y:550))
        path4.move(to: CGPoint(x: 200, y:100))
        path4.addLine(to: CGPoint(x:200,y:550))
        path5.move(to: CGPoint(x: 250, y:100))
        path5.addLine(to: CGPoint(x:250,y:550))

        var g = 0
        
        for x1 in 1...(fild+1)
        {
            if(x1%2==1)//배열이 홀수일때 즉 0,1 구분을 할때
            {
                    for y1 in 0...7 // 그안의 값들을 하나씩 정리한다.
                    {if(​emptyArray2​[x1][y1]==1)
                        {
                            path[g].move(to: CGPoint(x:75+(25*x1),y:150+50*(y1)))
                            path[g].addLine(to: CGPoint(x:125+(25*x1),y:150+50*(y1)))
                            g += 1
                        }
                    }
            }
        }
        
        func SerchSadari(Number:Int) -> Int
        {
            var StateX = 0
            var StateY = 0

            
            StateX = (Number-1)*2
            
            AnswerPath.move(to:  CGPoint(x:100+(StateX*25), y: 100))
            while StateY < 8 {
                if(StateX == 0)
                {
                    if(​emptyArray2​[StateX+1][StateY] == 1)
                    {  AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateX += 2
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateY += 1
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                    }
                    else
                    {
                        StateY += 1
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+(StateY*50)))
                    }
                }
                else if(StateX == (player-1)*2)
                {
                    if(​emptyArray2​[StateX-1][StateY] == 1)
                    {AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateX -= 2
                    AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateY += 1
                    AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                    }
                    else
                    {
                        StateY += 1
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+(StateY*50)))
                    }
                    
                }
                else
                {
                    if(​emptyArray2​[StateX-1][StateY] == 1)
                    {AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                    
                        StateX -= 2
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateY += 1
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                    }
                    else if(​emptyArray2​[StateX+1][StateY] == 1)
                    {AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateX += 2
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                        StateY += 1
                       AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+((StateY+1)*50)))
                    }
                    else
                    {
                        StateY += 1
                        AnswerPath.addLine(to: CGPoint(x:100+(StateX*25), y: 100+(StateY*50)))
                    }
                    
                }
            }
            
            return StateX
        }
        SerchSadari(Number: 1)
        
//        var j = 0;
//        var i = 0;
//        var z = 0;
//     while i <= 5
//     {
//        
//        path.move(to: CGPoint(x:100*x1,y:150+50*y1))
//        path.addLine(to: CGPoint(x:200*x1,y:150+50*y1))
    
//        path1.addLine(to: arrayCGPoint(x: i, y: j))
//        if(z%2==1)
//        
//        {j += 1
//        z += 1
//        }
//        else{
//        i += 1
//            z += 1
//        }
//       
//      
//        }

        

        UIColor.red.setStroke()
        path1.lineWidth = 4.0
        path1.stroke()
        
         UIColor.black.setStroke()
        path2.lineWidth = 4.0
        path2.stroke()
        
        UIColor.blue.setStroke()
        path3.lineWidth = 4.0
        path3.stroke()
        
        UIColor.green.setStroke()
        path4.lineWidth = 4.0
        path4.stroke()
        
        UIColor.gray.setStroke()
        path5.lineWidth = 4.0
        path5.stroke()
        
        UIColor.brown.setStroke()
        AnswerPath.lineWidth = 9.0
        AnswerPath.stroke()
        for i in 0...g
        {
            UIColor.red.setStroke()
            path[i].lineWidth = 5.0
            path[i].stroke()
           
        }
    
    }
    
    
    func arrayCGPoint(x:Int, y:Int) -> CGPoint {
        
        
        let xPoint = 100+25*y
        let yPoint = 100+50*x
        
        
        let point = CGPoint(x: xPoint, y: yPoint)
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            // do something with your currentPoint
            
            var path = UIBezierPath()
            path.move(to: CGPoint(x:100,y:200))
            path.addLine(to: currentPoint)
            UIColor.blue.setStroke()
            path.lineWidth = 10.0
            path.stroke()
            print("qweqwe")
        
        
            
        }
    }
}


