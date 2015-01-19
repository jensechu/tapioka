init = () ->

  # Create Tapioka Canvas
  @stage = new createjs.Stage('tapiokaCanvas')

  # Color Pallette
  gray        = '#BBBBBB'
  green       = '#ABF7B1'
  lightGreen  = '#C4F5C8'
  lightYellow = '#F1F7BE'
  lightOrange = '#F7E4BE'
  lightPink   = '#F7D4BE'

  mainMenu = () ->
    title = () ->
      titleText         = 'ｔａｐｉｏｋａ'
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
      subtitle.x     = 25
      subtitle.y     = 150

      @stage.addChild(subtitle)

    continueButton = () ->
      circleText = new createjs.Text()
      circleText.text  = 'start'
      circleText.font  = '20px Arial'
      circleText.color = gray
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
    levelTitle = () ->
      levelTitle = new createjs.Text()
      levelTitle.text  = 'measure ingredients'
      levelTitle.color = green
      levelTitle.font  = '50px Arial'

      @stage.addChild(levelTitle)

    levelTitle()

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
