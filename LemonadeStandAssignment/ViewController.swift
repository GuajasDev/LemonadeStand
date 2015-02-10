//
//  ViewController.swift
//  LemonadeStandAssignment
//
//  Created by Diego Guajardo on 7/02/2015.
//  Copyright (c) 2015 Guajas Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // =============== Properties ===============
    
    // ---------- Variables -----------
    
    // Containers
    var firstContainer:UIView!
    var secondContainer:UIView!
    var thirdContainer:UIView!
    var fourthContainer:UIView!
    var salesContainer:UIView!
    
    // Labels
    // firstContainer
    var youHaveMoneyLabel:UILabel!
    var youHaveLemonsLabel:UILabel!
    var youHaveIceCubesLabel:UILabel!
    // secondContainer
    var lemonsPriceLabel:UILabel!
    var iceCubesPriceLabel:UILabel!
    // thirdContained
    var lemonsMixLabel:UILabel!
    var iceCubesMixLabel:UILabel!
    // salesContainer
    var lemonadeTypeLabel:UILabel!
    var weatherLabel:UILabel!
    var numberOfCustomersLabel:UILabel!
    var customersThatPaidLabel:UILabel!
    var youMadeMoneyLabel:UILabel!
    var noMoreLeftLabel:UILabel!
    
    // ImageViews
    var weatherImageView:UIImageView!
    
    // Steppers
    var buyLemonsStepper:UIStepper!
    var buyIceCubesStepper:UIStepper!
    var mixLemonsStepper:UIStepper!
    var mixIceCubesStepper:UIStepper!
    
    // Buttons
    var startDayButton:UIButton!
    var goAgainButton:UIButton!
    var resetGameButton:UIButton!
    
    // Stats
    var money:Money = Money()
    var lemon:Lemon = Lemon()
    var iceCube:IceCube = IceCube()
    
    // General
    var weather:String = ""
    
    // ---------- Constants -----------
    
    let kPriceOfLemonade:CGFloat = 1.0
    
    let kMarginTop:CGFloat = 10.0
    let kTitleFontSize:CGFloat = 15.0
    let kTextFontSize:CGFloat = 12.0
    
    let kHalf:CGFloat = 1.0 / 2.0
    let kThird:CGFloat = 1.0 / 3.0
    let kFourth:CGFloat = 1.0 / 4.0
    let kSixth:CGFloat = 1.0/6.0
    let kEighth:CGFloat = 1.0 / 8.0
    
    // =============== Body ===============

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
        setupSalesContainer(self.salesContainer)
        
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ---------- Setup Views and containerViews ----------
    
    func setupContainerViews() {
        var containerFrame:CGRect
        
        // Setup first container
        containerFrame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y + kMarginTop,
                                width: self.view.bounds.width, height: self.view.bounds.height * kSixth - kMarginTop)
        self.firstContainer = UIView(frame: containerFrame)
        self.view.addSubview(self.firstContainer)
        
        // Setup second container
        containerFrame = CGRect(x: self.view.bounds.origin.x, y: self.firstContainer.bounds.height + kMarginTop,
                                width: self.view.bounds.width, height: self.view.bounds.height * kSixth * 1.5)
        self.secondContainer = UIView(frame: containerFrame)
        self.view.addSubview(self.secondContainer)
        
        // Setup third container
        containerFrame = CGRect(x: self.view.bounds.origin.x,
                                y: self.firstContainer.bounds.height + self.secondContainer.bounds.height + kMarginTop,
                                width: self.view.bounds.width,
                                height: self.view.bounds.height * kSixth * 1.5)
        self.thirdContainer = UIView(frame: containerFrame)
        self.view.addSubview(self.thirdContainer)
        
        // Setup fourth container
        containerFrame = CGRect(x: self.view.bounds.origin.x,
                                y: self.firstContainer.bounds.height + self.secondContainer.bounds.height + self.thirdContainer.bounds.height + kMarginTop,
                                width: self.view.bounds.width,
                                height: self.view.bounds.height * kSixth * 2.0)
        self.fourthContainer = UIView(frame: containerFrame)
        self.view.addSubview(self.fourthContainer)
        
        // Setup sales container
        containerFrame = CGRect(x: self.view.bounds.width * kSixth * kHalf,
                                y: self.view.bounds.height * kSixth,
                                width: self.view.bounds.width * kSixth * 5.0,
                                height: self.view.bounds.height * kHalf)
        self.salesContainer = UIView(frame: containerFrame)
        self.salesContainer.backgroundColor = UIColor(red: 225.0/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0)
        self.salesContainer.layer.borderWidth = 2.0
        self.salesContainer.layer.borderColor = UIColor.blackColor().CGColor
        self.salesContainer.hidden = true
        self.view.addSubview(self.salesContainer)
    }
    
    func setupFirstContainer(containerView: UIView) {
        var youHaveLabel:UILabel = UILabel()
        youHaveLabel.text = "You have:"
        youHaveLabel.textColor = UIColor.redColor()
        youHaveLabel.font = UIFont(name: "Menlo-Bold", size: kTextFontSize)
        youHaveLabel.sizeToFit()
        youHaveLabel.center = CGPoint(x: containerView.bounds.width * kThird,
                                      y: containerView.bounds.height * kFourth)
        containerView.addSubview(youHaveLabel)
        
        self.weatherImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0,
                                                          width: containerView.bounds.height * kThird * 1.5,
                                                          height: containerView.bounds.height * kThird * 1.5))
        self.weatherImageView.center = CGPoint(x: containerView.bounds.width * kThird, y: containerView.bounds.height * kFourth * 2.5)
        containerView.addSubview(self.weatherImageView)
        
        self.youHaveMoneyLabel = UILabel()
        self.youHaveMoneyLabel.text = "$9999"
        self.youHaveMoneyLabel.textColor = UIColor.blackColor()
        self.youHaveMoneyLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.youHaveMoneyLabel.sizeToFit()
        self.youHaveMoneyLabel.center = CGPoint(x: containerView.bounds.width * kHalf + self.youHaveMoneyLabel.bounds.width * kHalf,
                                                y: containerView.bounds.height * kFourth)
        containerView.addSubview(self.youHaveMoneyLabel)
        
        self.youHaveLemonsLabel = UILabel()
        self.youHaveLemonsLabel.text = "9999 Lemons"
        self.youHaveLemonsLabel.textColor = UIColor.blackColor()
        self.youHaveLemonsLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.youHaveLemonsLabel.sizeToFit()
        self.youHaveLemonsLabel.center = CGPoint(x: containerView.bounds.width * kHalf + self.youHaveLemonsLabel.bounds.width * kHalf,
                                                 y: containerView.bounds.height * kFourth * 2.0)
        containerView.addSubview(self.youHaveLemonsLabel)
        
        self.youHaveIceCubesLabel = UILabel()
        self.youHaveIceCubesLabel.text = "9999 Ice Cubes"
        self.youHaveIceCubesLabel.textColor = UIColor.blackColor()
        self.youHaveIceCubesLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.youHaveIceCubesLabel.sizeToFit()
        self.youHaveIceCubesLabel.center = CGPoint(x: containerView.bounds.width * kHalf + self.youHaveIceCubesLabel.bounds.width * kHalf,
                                                   y: containerView.bounds.height * kFourth * 3.0)
        containerView.addSubview(self.youHaveIceCubesLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        var stepOneLabel:UILabel = UILabel()
        stepOneLabel.text = "Step 1: Purchase Supplies"
        stepOneLabel.textColor = UIColor.blueColor()
        stepOneLabel.font = UIFont(name: "Menlo-Bold", size: kTitleFontSize)
        stepOneLabel.sizeToFit()
        stepOneLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                      y: containerView.bounds.height * kSixth)
        containerView.addSubview(stepOneLabel)
        
        var stepOneDescriptionLabel:UILabel = UILabel()
        stepOneDescriptionLabel.text = "How many lemons and ice cubes will you need today?"
        stepOneDescriptionLabel.textColor = UIColor.blackColor()
        stepOneDescriptionLabel.textAlignment = NSTextAlignment.Center
        stepOneDescriptionLabel.numberOfLines = 0
        stepOneDescriptionLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        stepOneDescriptionLabel.frame = CGRect(x: containerView.bounds.width * kSixth * kHalf,
                                               y: containerView.bounds.height * kSixth + stepOneLabel.bounds.height * kHalf,
                                               width: containerView.bounds.width * kSixth * 5.0,
                                               height: containerView.bounds.height * kFourth)
        containerView.addSubview(stepOneDescriptionLabel)
        
        self.lemonsPriceLabel = UILabel()
        self.lemonsPriceLabel.text = "Lemons for $2: 9999"
        self.lemonsPriceLabel.textColor = UIColor.blackColor()
        self.lemonsPriceLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.lemonsPriceLabel.sizeToFit()
        self.lemonsPriceLabel.center = CGPoint(x: containerView.bounds.width * kHalf - self.lemonsPriceLabel.bounds.width * kHalf,
                                               y: containerView.bounds.height * kSixth * 3.8)
        containerView.addSubview(self.lemonsPriceLabel)
        
        self.iceCubesPriceLabel = UILabel()
        self.iceCubesPriceLabel.text = "Ice Cubes for $1: 9999"
        self.iceCubesPriceLabel.textColor = UIColor.blackColor()
        self.iceCubesPriceLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.iceCubesPriceLabel.sizeToFit()
        self.iceCubesPriceLabel.center = CGPoint(x: containerView.bounds.width * kHalf - self.iceCubesPriceLabel.bounds.width * kHalf,
                                                 y: containerView.bounds.height * kSixth * 5.2)
        containerView.addSubview(self.iceCubesPriceLabel)
        
        self.buyLemonsStepper = UIStepper()
        self.buyLemonsStepper.tintColor = UIColor.blueColor()
        self.buyLemonsStepper.wraps = false
        self.buyLemonsStepper.autorepeat = true
        self.buyLemonsStepper.maximumValue = 9999
        self.buyLemonsStepper.center = CGPoint(x: containerView.bounds.width * kThird * 2.0,
                                               y: containerView.bounds.height * kSixth * 3.8)
        self.buyLemonsStepper.addTarget(self, action: "buyLemonsStepperValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        containerView.addSubview(self.buyLemonsStepper)
        
        self.buyIceCubesStepper = UIStepper()
        self.buyIceCubesStepper.tintColor = UIColor.blueColor()
        self.buyIceCubesStepper.wraps = false
        self.buyIceCubesStepper.autorepeat = true
        self.buyIceCubesStepper.maximumValue = 9999
        self.buyIceCubesStepper.center = CGPoint(x: containerView.bounds.width * kThird * 2.0,
                                                 y: containerView.bounds.height * kSixth * 5.2)
        self.buyIceCubesStepper.addTarget(self, action: "buyIceCubesStepperValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        containerView.addSubview(self.buyIceCubesStepper)
    }
    
    func setupThirdContainer(containerView: UIView) {
        var stepTwoLabel:UILabel = UILabel()
        stepTwoLabel.text = "Step 2: Mix Your Lemonade"
        stepTwoLabel.textColor = UIColor.blueColor()
        stepTwoLabel.font = UIFont(name: "Menlo-Bold", size: kTitleFontSize)
        stepTwoLabel.sizeToFit()
        stepTwoLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                      y: containerView.bounds.height * kSixth)
        containerView.addSubview(stepTwoLabel)
        
        var stepTwoDescriptionLabel:UILabel = UILabel()
        stepTwoDescriptionLabel.text = "Do your customers prefer more ice or more lemon today?"
        stepTwoDescriptionLabel.textColor = UIColor.blackColor()
        stepTwoDescriptionLabel.textAlignment = NSTextAlignment.Center
        stepTwoDescriptionLabel.numberOfLines = 0
        stepTwoDescriptionLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        stepTwoDescriptionLabel.frame = CGRect(x: containerView.bounds.width * kSixth * kHalf,
                                               y: containerView.bounds.height * kSixth + stepTwoLabel.bounds.height * kHalf,
                                               width: containerView.bounds.width * kSixth * 5.0,
                                               height: containerView.bounds.height * kFourth)
        containerView.addSubview(stepTwoDescriptionLabel)
        
        self.lemonsMixLabel = UILabel()
        self.lemonsMixLabel.text = "Lemons: 9999"
        self.lemonsMixLabel.textColor = UIColor.blackColor()
        self.lemonsMixLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.lemonsMixLabel.sizeToFit()
        self.lemonsMixLabel.center = CGPoint(x: containerView.bounds.width * kHalf - self.lemonsMixLabel.bounds.width * kHalf,
                                             y: containerView.bounds.height * kSixth * 3.8)
        containerView.addSubview(self.lemonsMixLabel)
        
        self.iceCubesMixLabel = UILabel()
        self.iceCubesMixLabel.text = "Ice Cubes: 9999"
        self.iceCubesMixLabel.textColor = UIColor.blackColor()
        self.iceCubesMixLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.iceCubesMixLabel.sizeToFit()
        self.iceCubesMixLabel.center = CGPoint(x: containerView.bounds.width * kHalf - self.iceCubesMixLabel.bounds.width * kHalf,
                                               y: containerView.bounds.height * kSixth * 5.2)
        containerView.addSubview(self.iceCubesMixLabel)
        
        self.mixLemonsStepper = UIStepper()
        self.mixLemonsStepper.tintColor = UIColor.blueColor()
        self.mixLemonsStepper.wraps = false
        self.mixLemonsStepper.autorepeat = true
        self.mixLemonsStepper.maximumValue = 9999
        self.mixLemonsStepper.center = CGPoint(x: containerView.bounds.width * kThird * 2.0,
                                               y: containerView.bounds.height * kSixth * 3.8)
        self.mixLemonsStepper.addTarget(self, action: "mixLemonsStepperValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        containerView.addSubview(self.mixLemonsStepper)
        
        self.mixIceCubesStepper = UIStepper()
        self.mixIceCubesStepper.tintColor = UIColor.blueColor()
        self.mixIceCubesStepper.wraps = false
        self.mixIceCubesStepper.autorepeat = true
        self.mixIceCubesStepper.maximumValue = 9999
        self.mixIceCubesStepper.center = CGPoint(x: containerView.bounds.width * kThird * 2.0,
                                                 y: containerView.bounds.height * kSixth * 5.2)
        self.mixIceCubesStepper.addTarget(self, action: "mixIceCubesStepperValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        containerView.addSubview(self.mixIceCubesStepper)
    }
    
    func setupFourthContainer(containerView: UIView) {
        var stepThreeLabel:UILabel = UILabel()
        stepThreeLabel.text = "Step 3: Start Selling Your Brew"
        stepThreeLabel.textColor = UIColor.blueColor()
        stepThreeLabel.font = UIFont(name: "Menlo-Bold", size: kTitleFontSize)
        stepThreeLabel.sizeToFit()
        stepThreeLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                        y: containerView.bounds.height * kSixth)
        containerView.addSubview(stepThreeLabel)
        
        var stepThreeDescriptionLabel:UILabel = UILabel()
        stepThreeDescriptionLabel.text = "At the end of the day you will either make or lose money. If you don't have enough money to buy new inventory then you lose the game"
        stepThreeDescriptionLabel.textColor = UIColor.blackColor()
        stepThreeDescriptionLabel.textAlignment = NSTextAlignment.Center
        stepThreeDescriptionLabel.numberOfLines = 0
        stepThreeDescriptionLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        stepThreeDescriptionLabel.frame = CGRect(x: containerView.bounds.width * kSixth * kHalf,
                                                 y: containerView.bounds.height * kSixth + stepThreeLabel.bounds.height,
                                                 width: containerView.bounds.width * kSixth * 5.0,
                                                 height: 0.0)
        stepThreeDescriptionLabel.sizeToFit()
        containerView.addSubview(stepThreeDescriptionLabel)
        
        var buttonRect = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 35.0)
        self.startDayButton = UIButton(frame: buttonRect)
        self.startDayButton.setTitle("Start Day", forState: UIControlState.Normal)
        self.startDayButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.startDayButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: kTitleFontSize)
        self.startDayButton.backgroundColor = UIColor.yellowColor()
        self.startDayButton.center = CGPoint(x: containerView.bounds.width * kHalf, y: containerView.bounds.height * kFourth * 3.0)
        self.startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.startDayButton)
    }
    
    func setupSalesContainer(containerView: UIView) {
        var titleLabel:UILabel = UILabel()
        titleLabel.text = "Report Of The Day"
        titleLabel.textColor = UIColor.blueColor()
        titleLabel.font = UIFont(name: "Menlo-Bold", size: kTitleFontSize)
        titleLabel.sizeToFit()
        titleLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                    y: containerView.bounds.height * kEighth)
        containerView.addSubview(titleLabel)
        
        self.weatherLabel = UILabel()
        self.weatherLabel.text = "The weather was Warm"
        self.weatherLabel.textAlignment = NSTextAlignment.Center
        self.weatherLabel.textColor = UIColor.blackColor()
        self.weatherLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.weatherLabel.sizeToFit()
        self.weatherLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                           y: containerView.bounds.height * kEighth * 2.0)
        containerView.addSubview(self.weatherLabel)
        
        self.lemonadeTypeLabel = UILabel()
        self.lemonadeTypeLabel.text = "Your lemonade was Diluted"
        self.lemonadeTypeLabel.textAlignment = NSTextAlignment.Center
        self.lemonadeTypeLabel.textColor = UIColor.blackColor()
        self.lemonadeTypeLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.lemonadeTypeLabel.sizeToFit()
        self.lemonadeTypeLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                                y: containerView.bounds.height * kEighth * 3.0)
        containerView.addSubview(self.lemonadeTypeLabel)
        
        self.numberOfCustomersLabel = UILabel()
        self.numberOfCustomersLabel.text = "99 customers visited you"
        self.numberOfCustomersLabel.textColor = UIColor.blackColor()
        self.numberOfCustomersLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.numberOfCustomersLabel.sizeToFit()
        self.numberOfCustomersLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                                     y: containerView.bounds.height * kEighth * 4.0)
        containerView.addSubview(self.numberOfCustomersLabel)
        
        self.customersThatPaidLabel = UILabel()
        self.customersThatPaidLabel.text = "99 customers bought your lemonade"
        self.customersThatPaidLabel.textColor = UIColor.blackColor()
        self.customersThatPaidLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.customersThatPaidLabel.sizeToFit()
        self.customersThatPaidLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                                     y: containerView.bounds.height * kEighth * 5.0)
        containerView.addSubview(self.customersThatPaidLabel)
        
        self.youMadeMoneyLabel = UILabel()
        self.youMadeMoneyLabel.text = "You made $99"
        self.youMadeMoneyLabel.textColor = UIColor.blackColor()
        self.youMadeMoneyLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.youMadeMoneyLabel.sizeToFit()
        self.youMadeMoneyLabel.center = CGPoint(x: containerView.bounds.width * kHalf,
                                                y: containerView.bounds.height * kEighth * 6.0)
        containerView.addSubview(self.youMadeMoneyLabel)
        
        self.goAgainButton = UIButton(frame:CGRect(x: 0.0, y: 0.0, width: 120.0, height: 35.0))
        self.goAgainButton.setTitle("Go Again", forState: UIControlState.Normal)
        self.goAgainButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        self.goAgainButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: kTitleFontSize)
        self.goAgainButton.backgroundColor = UIColor.yellowColor()
        self.goAgainButton.center = CGPoint(x: containerView.bounds.width * kHalf,
            y: containerView.bounds.height * kEighth * 7.0)
        self.goAgainButton.addTarget(self, action: "goAgainButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.goAgainButton)
        
        // Used when there is a Game Over
        self.noMoreLeftLabel = UILabel()
        self.noMoreLeftLabel.text = "You have no more money, lemons or ice cubes"
        self.noMoreLeftLabel.textAlignment = NSTextAlignment.Center
        self.noMoreLeftLabel.textColor = UIColor.blackColor()
        self.noMoreLeftLabel.numberOfLines = 0
        self.noMoreLeftLabel.font = UIFont(name: "Menlo", size: kTextFontSize)
        self.noMoreLeftLabel.frame = CGRect(x: containerView.bounds.width * kSixth * kHalf,
            y: containerView.bounds.height * kEighth * 3.0 + self.lemonadeTypeLabel.bounds.height,
            width: containerView.bounds.width * kSixth * 5.0,
            height: 0)
        self.noMoreLeftLabel.sizeToFit()
        self.noMoreLeftLabel.hidden = true
        self.salesContainer.addSubview(self.noMoreLeftLabel)
    }
    
    // ---------- Steppers ----------
    
    func buyLemonsStepperValueChanged(sender: UIStepper!) {
        
        // Calculaate how much money the player has spent this round
        var moneySpent = self.lemon.price * CGFloat(self.buyLemonsStepper.value) + self.iceCube.price * CGFloat(self.buyIceCubesStepper.value)
        
        if (self.money.initial - moneySpent) < 0.0 {
            // If the money at the begining of the turn minus the money spent is less than zero the player has no more money left
            // Reset the stepper value
            sender.value -= 1
        } else if (self.lemon.initial + self.lemon.used) <= 0 && Int(sender.value) < self.lemon.stepper1 {
            // Else if there are no more lemons left AND the player is trying to sell them
            // Reset the stepper value
            sender.value += 1
        } else {
            // The player can either buy or sell lemons
            self.lemon.bought = Int(sender.value)
            self.lemon.used = self.lemon.bought - self.lemon.mixed
            updateView()
        }
        
        // Save the value of the stepper
        self.lemon.stepper1 = Int(sender.value)
    }
    
    func buyIceCubesStepperValueChanged(sender: UIStepper!) {
        
        // Calculaate how much money the player has spent this round
        var moneySpent = self.lemon.price * CGFloat(self.buyLemonsStepper.value) + self.iceCube.price * CGFloat(self.buyIceCubesStepper.value)
        
        if (self.money.initial - moneySpent) < 0.0 {
            // If the money at the begining of the turn minus the money spent is less than zero the player has no more money left
            // Reset the stepper value
            sender.value -= 1
        } else if (self.iceCube.initial + self.iceCube.used) <= 0 && Int(sender.value) < self.iceCube.stepper1 {
            // Else if there are no more ice cubes left AND the player is trying to sell them
            // Reset the stepper value
            sender.value += 1
        } else {
            // The player can either buy or sell ice cubes
            self.iceCube.bought = Int(sender.value)
            self.iceCube.used = self.iceCube.bought - self.iceCube.mixed
            updateView()
        }
        
        // Save the value of the stepper
        self.iceCube.stepper1 = Int(sender.value)
    }
    
    func mixLemonsStepperValueChanged(sender: UIStepper!) {
        
        // Save how many lemons will be mixed
        var lemonMix = Int(sender.value)
        
        if (self.lemon.initial + (self.lemon.bought - lemonMix)) < 0 {
            // If the amout of lemons that the turn started with plus the difference between the bought and used lemons is less than zero the player has no more lemons
            // Reset the stepper value
            sender.value -= 1
        } else {
            // The player can either use more or less lemons for the mix
            self.lemon.mixed = Int(sender.value)
            self.lemon.used = self.lemon.bought - self.lemon.mixed
            updateView()
        }
    }
    
    func mixIceCubesStepperValueChanged(sender: UIStepper!) {
        var iceCubeMix = Int(sender.value)
        
        if (self.iceCube.initial + (self.iceCube.bought - iceCubeMix)) < 0 {
            // If the amout of ice cubes that the turn started with plus the difference between the bought and used ice cubes is less than zero the player has no more ice cubes
            // Reset the stepper value
            sender.value -= 1
        } else {
            // The player can either use more or less ice cubes for the mix
            self.iceCube.mixed = Int(sender.value)
            self.iceCube.used = self.iceCube.bought - self.iceCube.mixed
            updateView()
        }
    }
    
    // ---------- Buttons ----------
    
    func startDayButtonPressed(button: UIButton) {
        
        // The initial money for the next turn is the initial money from this turn minus the spent money
        self.money.initial -= self.money.spent
        self.money.spent = 0.0
        
        // Check if the player has entered either a lemon or an ice cube to mix in the lemonade
        if self.lemon.mixed != 0 || self.iceCube.mixed != 0 {
            let lemonadeToday = LemonadeBrain.createLemonadeRatio(self.lemon.mixed, iceCubes: self.iceCube.mixed)
            let paidToday = LemonadeBrain.customersPaidToday(LemonadeBrain.customersToVisitToday(self.weather), lemonade: lemonadeToday)
            getPaid(paidToday)
            showSalesOfTheDay(lemonadeToday, visitedToday: paidToday)
        }
        
        // The initial lemons for the next turn is the initial lemons from this turn plus the used lemons (which can be - or +)
        self.lemon.initial += self.lemon.used
        self.lemon.bought = 0
        self.lemon.mixed = 0
        self.lemon.used = 0
        self.lemon.stepper1 = 0
        
        // The initial ice cubes for the next turn is the initial ice cubes from this turn minus the used ice cubes (which can be - or +)
        self.iceCube.initial += self.iceCube.used
        self.iceCube.bought = 0
        self.iceCube.mixed = 0
        self.iceCube.used = 0
        self.iceCube.stepper1 = 0
        
        // Reset the values of the steppers to zero
        self.buyLemonsStepper.value = 0
        self.buyIceCubesStepper.value = 0
        self.mixLemonsStepper.value = 0
        self.mixIceCubesStepper.value = 0
        
        // If there is no more money, lemons or ice cubes left then it is game over
        if self.money.initial < self.lemon.price && self.money.initial < self.iceCube.price && self.lemon.initial <= 0 && self.iceCube.initial <= 0 {
            gameOver()
        }
    }
    
    func goAgainButtonPressed(button: UIButton) {
        // Hide the salesContainer and enable the startDayButton
        self.salesContainer.hidden = true
        self.startDayButton.enabled = true
        setRandomWeater()
        updateView()
    }
    
    // ---------- Setup Values Functions ----------
    
    func resetGame() {
        // Set the initial values
        self.money.initial = 10.0
        self.lemon.initial = 1
        self.lemon.bought = 0
        self.lemon.mixed = 0
        self.lemon.used = self.lemon.bought - self.lemon.mixed
        self.iceCube.initial = 1
        self.iceCube.bought = 0
        self.iceCube.mixed = 0
        self.iceCube.used = self.iceCube.bought - self.iceCube.mixed
        
        // Set the steppers to zero
        self.buyLemonsStepper.value = 0
        self.buyIceCubesStepper.value = 0
        self.mixLemonsStepper.value = 0
        self.mixIceCubesStepper.value = 0
        
        // Make sure the labels and button for salesContainer are not hidden and has the correct value (respectively), since they are set to hidden and the value is changed on gameOver()
        self.lemonadeTypeLabel.hidden = false
        self.weatherLabel.hidden = false
        self.numberOfCustomersLabel.hidden = false
        self.customersThatPaidLabel.hidden = false
        self.youMadeMoneyLabel?.hidden = false
        self.goAgainButton.setTitle("Go Again", forState: UIControlState.Normal)
        self.goAgainButton.addTarget(self, action: "goAgainButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        // Hide the label that is used in salesContainer by gameOver()
        self.noMoreLeftLabel.hidden = true
        
        // Hide the salesContainer and enable the startDayButton
        self.salesContainer.hidden = true
        self.startDayButton.enabled = true
        
        setRandomWeater()
        updateView()
    }
    
    func updateView() {
        
        // Calculate how much money has been spent
        self.money.spent = self.lemon.price * CGFloat(self.buyLemonsStepper.value) + self.iceCube.price * CGFloat(self.buyIceCubesStepper.value)
        
        // If there is no more money, set the money label to have a red font
        if (self.money.initial - self.money.spent) <= 0.0 {
            self.youHaveMoneyLabel.textColor = UIColor.redColor()
        } else {
            self.youHaveMoneyLabel.textColor = UIColor.blackColor()
        }
        
        // If there is no more lemons, set the lemons label to have a red font
        if (self.lemon.initial + self.lemon.used) <= 0 {
            self.youHaveLemonsLabel.textColor = UIColor.redColor()
        } else {
            self.youHaveLemonsLabel.textColor = UIColor.blackColor()
        }
        
        // If there is no more ice cubes, set the ice cubes label to have a red font
        if (self.iceCube.initial + self.iceCube.used) <= 0 {
            self.youHaveIceCubesLabel.textColor = UIColor.redColor()
        } else {
            self.youHaveIceCubesLabel.textColor = UIColor.blackColor()
        }
        
        // Update the value of all the labels
        self.youHaveMoneyLabel.text = "$\(self.money.initial - self.money.spent)"
        self.youHaveLemonsLabel.text = "\(self.lemon.initial + self.lemon.used) Lemons"
        self.youHaveIceCubesLabel.text = "\(self.iceCube.initial + self.iceCube.used) Ice Cubes"
        self.lemonsPriceLabel.text = "Lemons for $2: \(Int(self.buyLemonsStepper.value))"
        self.iceCubesPriceLabel.text = "Ice Cubes for $1: \(Int(self.buyIceCubesStepper.value))"
        self.lemonsMixLabel.text = "Lemons: \(Int(self.mixLemonsStepper.value))"
        self.iceCubesMixLabel.text = "Ice Cubes: \(Int(self.mixIceCubesStepper.value))"
    }
    
    func showSalesOfTheDay(lemonadeToday: String, visitedToday: Array<Bool>) {
        
        // Check how many customers bought a lemonade
        var customersThatPaid:Int = 0
        for customerPaid in visitedToday {
            if customerPaid {
                customersThatPaid += 1
            }
        }
        
        // Shoe the salesContainer and disable the startOfDayButton
        self.salesContainer.hidden = false
        self.startDayButton.enabled = false
        
        // Update the vavlues of the labels in the salesContainer
        self.weatherLabel.text = "The weather was " + self.weather
        self.lemonadeTypeLabel.text = "Your lemonade was " + lemonadeToday
        self.numberOfCustomersLabel.text = "\(visitedToday.count) customers visited you"
        self.customersThatPaidLabel.text = "\(customersThatPaid) customers bought your lemonade"
        self.youMadeMoneyLabel.text = "You made $\(customersThatPaid)"
    }
    
    func gameOver() {
        
        // Show the salesContainer and disable the startDayButton
        self.salesContainer.hidden = false
        self.startDayButton.enabled = false
        
        // Change the values in the labels used to show the game is over
        self.lemonadeTypeLabel.text = "Game Over!"
        self.noMoreLeftLabel.hidden = false
        
        // Hide the labels that are not being used
        self.weatherLabel.hidden = true
        self.numberOfCustomersLabel.hidden = true
        self.customersThatPaidLabel.hidden = true
        self.youMadeMoneyLabel.hidden = true
        
        // Change the title and target of the button so it can reset the game
        self.goAgainButton.setTitle("New Game", forState: UIControlState.Normal)
        self.goAgainButton.addTarget(self, action: "resetGame", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    // ---------- Stats Functions ----------
    
    func getPaid(paidToday: Array<Bool>) {
        
        // Check how much money you should make
        for customerPaid in paidToday {
            if customerPaid {
                self.money.initial += kPriceOfLemonade
            }
        }
    }
    
    func setRandomWeater() {
        
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        switch randomNumber {
        case 0:
            self.weatherImageView.image = UIImage(named: "Cold")
            self.weather = "Cold"
        case 1:
            self.weatherImageView.image = UIImage(named: "Mild")
            self.weather = "Mild"
        default:
            self.weatherImageView.image = UIImage(named: "Warm")
            self.weather = "Warm"
        }
    }
}