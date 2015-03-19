init = () ->

  # Create Tapioka Canvas
  @stage = new createjs.Stage('tapiokaCanvas')

  # Color Pallette
  white       = '#FFFFFF'
  gray        = '#BBBBBB'
  green       = '#ABF7B1'
  lightGreen  = '#C4F5C8'
  lightYellow = '#F1F7BE'
  lightOrange = '#F7E4BE'
  lightPink   = '#F7D4BE'

  mainMenu = () ->
    title = () ->
      titleText         = 't a p i o k a'
      titleFont         = '80px Arial'
      titleColor        = lightGreen
      titleOutlineColor = green
      titleYPosition    = 50

      title = new createjs.Text()
      title.text  = titleText
      title.font  = titleFont
      title.color = titleColor
      title.y     = titleYPosition

      titleOutline = new createjs.Text()
      titleOutline.text    = titleText
      titleOutline.font    = titleFont
      titleOutline.color   = titleOutlineColor
      titleOutline.y       = titleYPosition
      titleOutline.outline = 2

      @stage.addChild(title, titleOutline)

    subtitle = () ->
      subtitle = new createjs.Text()
      subtitle.text  = 'by jensen'
      subtitle.font  = '20px Arial'
      subtitle.color = gray
      subtitle.y     = 150

      @stage.addChild(subtitle)

    continueButton = () ->
      circleText = new createjs.Text()
      circleText.text  = 'start'
      circleText.font  = '20px Arial'
      circleText.color = white
      circleText.x     = 380
      circleText.y     = 390

      circle = new createjs.Shape()
      circle.graphics.beginFill(lightPink).drawCircle(0, 0, 50)
      circle.x = 400
      circle.y = 400

      @stage.addChild(circle, circleText)

      circle.on 'click', (event) ->
        handleCircleClick()

    handleCircleClick = (event) ->
      setStage 'measureIngredients'

    title()
    subtitle()
    continueButton()

  measureIngredients = () ->
    cup   = new createjs.Shape()
    water = new createjs.Shape()

    cupX = 300
    cupY = 200

    waterX      = cupX + 85
    waterY      = cupY - 100
    waterHeight = 50

    levelTitle = () ->
      levelTitle = new createjs.Text()
      levelTitle.text  = 'measure ingredients'
      levelTitle.color = green
      levelTitle.font  = '50px Arial'

      @stage.addChild(levelTitle)

    measuringCup = () ->
      cup.graphics.beginFill(lightPink).drawRect(cupX, cupY, 225, 250)

      @stage.addChild(cup)

    faucetWater = () ->
      water.graphics.beginFill('#3394F7').drawRect(waterX, waterY, 50, waterHeight)

      @stage.addChild(water)

    runFaucet = (timer) ->
      console.log('running' , waterHeight)

      if waterHeight < 350
        waterHeight++
        console.log(waterHeight)

        water.graphics.clear()
        water.graphics.beginFill('#3394F7').drawRect(waterX, waterY, 50, waterHeight)

        updateStage()

      if waterHeight == 350
        console.log('clearing')
        clearTimeout(timer)

    pourWater = () ->
      pourInterval = setInterval (-> runFaucet pourInterval), 10

    levelTitle()
    measuringCup()
    faucetWater()
    pourWater()

  setStage = (levelName) ->
    clearStage()

    switch levelName
      when 'mainMenu'           then mainMenu()
      when 'measureIngredients' then measureIngredients()

    updateStage()

  clearStage = () ->
    @stage.removeAllChildren()

  updateStage = () ->
    @stage.update()

  # Start Menu Screen
  setStage 'mainMenu'

init()
