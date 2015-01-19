function init() {

  // Create Tapioka Canvas
  var stage = new createjs.Stage("tapiokaCanvas");

  function mainMenu() {
    title();
  }

  function title() {
    var titleText         = "ｔａｐｉｏｋａ";
    var titleFont         = "80px Arial";
    var titleColor        = "#C4F5C8";
    var titleOutlineColor = "#ABF7B1";
    var titleYPosition    = 50;

    var subtitleText         = "by jensen";
    var subtitleFont         = "20px Arial";
    var subtitleColor        = "#BEC3BC";
    var subtitleXPosition    = 25 ;
    var subtitleYPosition    = 150;

    var title = new createjs.Text();
    title.text  = titleText;
    title.font  = titleFont;
    title.color = titleColor;
    title.y     = titleYPosition;

    var titleOutline = new createjs.Text();
    titleOutline.text   = titleText;
    titleOutline.font   = titleFont;
    titleOutline.color  = titleOutlineColor;
    titleOutline.y      = titleYPosition;
    titleOutline.outline = 2;

    var subtitle = new createjs.Text();
    subtitle.text  = subtitleText;
    subtitle.font  = subtitleFont;
    subtitle.color = subtitleColor;
    subtitle.x     = subtitleXPosition;
    subtitle.y     = subtitleYPosition;

    stage.addChild(title, titleOutline, subtitle);
  }

  // Start Menu Screen
  mainMenu();

  // Redraw Tapioka Canvas
  stage.update();
}
