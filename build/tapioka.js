// Generated by CoffeeScript 1.8.0
(function() {
  var init;

  init = function() {
    var mainMenu, stage, title;
    stage = new createjs.Stage('tapiokaCanvas');
    mainMenu = function() {
      return title();
    };
    title = function() {
      var subtitle, subtitleColor, subtitleFont, subtitleText, subtitleXPosition, subtitleYPosition, titleColor, titleFont, titleOutline, titleOutlineColor, titleText, titleYPosition;
      titleText = 'ｔａｐｉｏｋａ';
      titleFont = '80px Arial';
      titleColor = '#C4F5C8';
      titleOutlineColor = '#ABF7B1';
      titleYPosition = 50;
      subtitleText = 'by jensen';
      subtitleFont = '20px Arial';
      subtitleColor = '#BBB';
      subtitleXPosition = 25;
      subtitleYPosition = 150;
      title = new createjs.Text();
      title.text = titleText;
      title.font = titleFont;
      title.color = titleColor;
      title.y = titleYPosition;
      titleOutline = new createjs.Text();
      titleOutline.text = titleText;
      titleOutline.font = titleFont;
      titleOutline.color = titleOutlineColor;
      titleOutline.y = titleYPosition;
      titleOutline.outline = 2;
      subtitle = new createjs.Text();
      subtitle.text = subtitleText;
      subtitle.font = subtitleFont;
      subtitle.color = subtitleColor;
      subtitle.x = subtitleXPosition;
      subtitle.y = subtitleYPosition;
      return stage.addChild(title, titleOutline, subtitle);
    };
    mainMenu();
    return stage.update();
  };

  init();

}).call(this);
