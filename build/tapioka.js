// Generated by CoffeeScript 1.9.0
(function() {
  var init;

  init = function() {
    var blue, clearStage, gray, green, lightGreen, lightOrange, lightPink, lightYellow, mainMenu, measureIngredients, red, setStage, updateStage, white;
    this.stage = new createjs.Stage('tapiokaCanvas');
    red = '#F00';
    white = '#FFFFFF';
    gray = '#BBBBBB';
    green = '#ABF7B1';
    blue = '#3394F7';
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
      var cup, cupX, cupY, faucetWater, levelTitle, measuringCup, pooledWater, pooledWaterHeight, pooledWaterOffset, pourWater, runFaucet, showFailedText, water, waterHeight, waterInCup, waterX, waterY;
      cup = new createjs.Shape();
      water = new createjs.Shape();
      pooledWater = new createjs.Shape();
      cupX = 300;
      cupY = 200;
      waterX = cupX + 85;
      waterY = cupY - 100;
      waterHeight = 50;
      pooledWaterHeight = 0;
      pooledWaterOffset = 250;
      levelTitle = function() {
        levelTitle = new createjs.Text();
        levelTitle.text = 'measure ingredients';
        levelTitle.color = green;
        levelTitle.font = '50px Arial';
        return this.stage.addChild(levelTitle);
      };
      showFailedText = function() {
        var failedText;
        failedText = new createjs.Text();
        failedText.text = 'too much! you fail.';
        failedText.color = red;
        failedText.font = '80px Arial';
        failedText.x = 50;
        failedText.y = 200;
        return this.stage.addChild(failedText);
      };
      measuringCup = function() {
        cup.graphics.beginFill(lightPink).drawRect(cupX, cupY, 225, 250);
        return this.stage.addChild(cup);
      };
      faucetWater = function() {
        water.graphics.beginFill(blue).drawRect(waterX, waterY, 50, waterHeight);
        return this.stage.addChild(water);
      };
      waterInCup = function() {
        pooledWater.graphics.beginFill(blue).drawRect(cupX, cupY + pooledWaterOffset, 225, pooledWaterHeight);
        return this.stage.addChild(pooledWater);
      };
      runFaucet = function(timer) {
        if (waterHeight < 340) {
          waterHeight++;
          water.graphics.clear();
          water.graphics.beginFill(blue).drawRect(waterX, waterY, 50, waterHeight);
          updateStage();
        }
        if (waterHeight === 340) {
          if (pooledWaterHeight > 250) {
            clearTimeout(timer);
            showFailedText();
          }
          pooledWaterHeight++;
          pooledWaterOffset--;
          pooledWater.graphics.clear();
          pooledWater.graphics.beginFill(blue).drawRect(cupX + 10, cupY - 10 + pooledWaterOffset, 205, pooledWaterHeight);
          return updateStage();
        }
      };
      pourWater = function() {
        var pourInterval;
        return pourInterval = setInterval((function() {
          return runFaucet(pourInterval);
        }), 5);
      };
      levelTitle();
      measuringCup();
      faucetWater();
      pourWater();
      return waterInCup();
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
