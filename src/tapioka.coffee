init = () ->

  # Create Tapioka Canvas
  stage = new createjs.Stage('tapiokaCanvas')

  mainMenu = () ->
    title()

  title = () ->
    titleText         = 'ｔａｐｉｏｋａ'
    titleFont         = '80px Arial'
    titleColor        = '#C4F5C8'
    titleOutlineColor = '#ABF7B1'
    titleYPosition    = 50

    subtitleText         = 'by jensen'
    subtitleFont         = '20px Arial'
    subtitleColor        = '#BBB'
    subtitleXPosition    = 25
    subtitleYPosition    = 150

    title = new createjs.Text()
    title.text  = titleText
    title.font  = titleFont
    title.color = titleColor
    title.y     = titleYPosition

    titleOutline = new createjs.Text()
    titleOutline.text   = titleText
    titleOutline.font   = titleFont
    titleOutline.color  = titleOutlineColor
    titleOutline.y      = titleYPosition
    titleOutline.outline = 2

    subtitle = new createjs.Text()
    subtitle.text  = subtitleText
    subtitle.font  = subtitleFont
    subtitle.color = subtitleColor
    subtitle.x     = subtitleXPosition
    subtitle.y     = subtitleYPosition

    stage.addChild(title, titleOutline, subtitle)

  # Start Menu Screen
  mainMenu()

  # Redraw Tapioka Canvas
  stage.update()

init()
