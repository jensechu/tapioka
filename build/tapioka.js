// Generated by CoffeeScript 1.9.0
(function() {
  var init;

  init = function() {
    var clearStage, gray, green, lightGreen, lightOrange, lightPink, lightYellow, mainMenu, measureIngredients, setStage, updateStage, white;
    this.stage = new createjs.Stage('tapiokaCanvas');
    white = '#FFFFFF';
    gray = '#BBBBBB';
    green = '#ABF7B1';
    lightGreen = '#C4F5C8';
    lightYellow = '#F1F7BE';
    lightOrange = '#F7E4BE';
    lightPink = '#F7D4BE';
    mainMenu = function() {
      var continueButton, handleCircleClick, subtitle, title;
      title = function() {
        var titleColor, titleFont, titleOutline, titleOutlineColor, titleText, titleYPosition;
        titleText = 't a p i o k a';
        titleFont = '80px Arial';
        titleColor = lightGreen;
        titleOutlineColor = green;
        titleYPosition = 50;
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
        return this.stage.addChild(title, titleOutline);
      };
      subtitle = function() {
        subtitle = new createjs.Text();
        subtitle.text = 'by jensen';
        subtitle.font = '20px Arial';
        subtitle.color = gray;
        subtitle.y = 150;
        return this.stage.addChild(subtitle);
      };
      continueButton = function() {
        var circle, circleText;
        circleText = new createjs.Text();
        circleText.text = 'start';
        circleText.font = '20px Arial';
        circleText.color = white;
        circleText.x = 380;
        circleText.y = 390;
        circle = new createjs.Shape();
        circle.graphics.beginFill(lightPink).drawCircle(0, 0, 50);
        circle.x = 400;
        circle.y = 400;
        this.stage.addChild(circle, circleText);
        return circle.on('click', function(event) {
          return handleCircleClick();
        });
      };
      handleCircleClick = function(event) {
        return setStage('measureIngredients');
      };
      title();
      subtitle();
      return continueButton();
    };
    measureIngredients = function() {
      var cup, cupX, cupY, faucetWater, levelTitle, measuringCup, pourWater, water, waterHeight, waterX, waterY;
      cup = new createjs.Shape();
      water = new createjs.Shape();
      cupX = 300;
      cupY = 200;
      waterX = cupX + 85;
      waterY = cupY - 100;
      waterHeight = 50;
      levelTitle = function() {
        levelTitle = new createjs.Text();
        levelTitle.text = 'measure ingredients';
        levelTitle.color = green;
        levelTitle.font = '50px Arial';
        return this.stage.addChild(levelTitle);
      };
      measuringCup = function() {
        cup.graphics.beginFill(lightPink).drawRect(cupX, cupY, 225, 250);
        return this.stage.addChild(cup);
      };
      faucetWater = function() {
        water.graphics.beginFill('#3394F7').drawRect(waterX, waterY, waterHeight, 50);
        return this.stage.addChild(water);
      };
      pourWater = function() {
        var pixels, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = waterHeight.length; _i < _len; _i += 1) {
          pixels = waterHeight[_i];
          _results.push(console.log(pixels));
        }
        return _results;
      };
      levelTitle();
      measuringCup();
      faucetWater();
      return pourWater();
    };
    setStage = function(levelName) {
      clearStage();
      switch (levelName) {
        case 'mainMenu':
          mainMenu();
          break;
        case 'measureIngredients':
          measureIngredients();
      }
      return updateStage();
    };
    clearStage = function() {
      return this.stage.removeAllChildren();
    };
    updateStage = function() {
      return this.stage.update();
    };
    return setStage('mainMenu');
  };

  init();

}).call(this);
