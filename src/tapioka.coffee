init = () ->

  # Create Tapioka Canvas
  @stage = new createjs.Stage('tapiokaCanvas')

  # Color Pallette
  red         = '#F00'
  white       = '#FFFFFF'
  gray        = '#BBBBBB'
  green       = '#ABF7B1'
  blue        = '#3394F7'
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
    cup         = new createjs.Shape()
    water       = new createjs.Shape()
    pooledWater = new createjs.Shape()

    cupX      = 300
    cupY      = 300
    cupWidth  = 225
    cupHeight = 250

    waterX      = cupX + 85
    waterY      = cupY - 100
    waterHeight = 0
    waterWidth  = 50

    pooledWaterPadding = 10
    pooledWaterX       = cupX + pooledWaterPadding
    pooledWaterY       = cupY - pooledWaterPadding
    pooledWaterOffset  = 250
    pooledWaterHeight  = 0
    pooledWaterWidth   = cupWidth - (pooledWaterPadding * 2)

    levelTitle = () ->
      levelTitle = new createjs.Text()
      levelTitle.text  = 'measure ingredients'
      levelTitle.color = green
      levelTitle.font  = '50px Arial'
      levelTitle.y     = 50

      @stage.addChild(levelTitle)

    showFailedText = () ->
      failedText = new createjs.Text()
      failedText.text  = 'too much! you fail.'
      failedText.color = red
      failedText.font  = '80px Arial'
      failedText.x     = 50
      failedText.y     = 300

      @stage.addChild(failedText)

      resetTimeout = setTimeout (-> setStage 'mainMenu'), 5000

    measuringCup = () ->
      cup.graphics.beginFill(lightPink).drawRect(
        cupX,
        cupY,
        cupWidth,
        cupHeight)

      @stage.addChild(cup)

    faucetWater = () ->
      water.graphics.beginFill(blue).drawRect(
        waterX,
        waterY,
        waterWidth,
        waterHeight)

      @stage.addChild(water)

    waterInCup = () ->
      pooledWater.graphics.beginFill(blue).drawRect(
        cupX,
        cupY + pooledWaterOffset,
        cupWidth,
        pooledWaterHeight)

      @stage.addChild(pooledWater)

    runFaucet = (timer) ->
      if waterHeight < 340
        waterHeight++

        water.graphics.clear()
        water.graphics.beginFill(blue).drawRect(
          waterX,
          waterY,
          waterWidth,
          waterHeight)

        updateStage()

      if waterHeight == 340
        if pooledWaterHeight > cupHeight
          clearTimeout(timer)
          showFailedText()

        pooledWaterHeight++
        pooledWaterOffset--

        pooledWater.graphics.clear()
        pooledWater.graphics.beginFill(blue).drawRect(
          pooledWaterX,
          pooledWaterY + pooledWaterOffset,
          pooledWaterWidth,
          pooledWaterHeight)

        updateStage()

    pourWater = () ->
      pourInterval = setInterval (-> runFaucet pourInterval), 5

    levelTitle()
    measuringCup()
    faucetWater()
    pourWater()
    waterInCup()

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
