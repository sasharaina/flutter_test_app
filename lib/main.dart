import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// TODO дописать необходимые коментарии

var rng = new Random();
const half = 128; // половина от 256 для дальнейшей работы с цветами

getOppositeNumber(number){ // функция возвращает  число для максимально непохожего цвета
  var result;
  if(number < half)
    result = number + half;
  else
    result = number - half;
  return result;
}

// функция которая возвращает два рандомных числа между которыми разница half
getSixRandomNumbers(){

  // красный цвет
  var r_1 = rng.nextInt(255);
  var r_2 = getOppositeNumber(r_1);

  // зелёный цвет
  var g_1 = rng.nextInt(255);
  var g_2 = getOppositeNumber(g_1);

  // синий цвет
  var b_1 = rng.nextInt(255);
  var b_2 = getOppositeNumber(b_1);

  return [ r_1, g_1, b_1, r_2, g_2, b_2 ];
}

var numbers = getSixRandomNumbers();

TextStyle textStyle = TextStyle(
  color: Color.fromARGB(255, numbers[0], numbers[1], numbers[2]), //  цвет текста
  fontSize: 45.0, //  размер шрифта
  fontStyle: FontStyle.italic
);

Text text = Text( // отрисовывает текст
  'Hey there', // текст
  style: textStyle
);

Center center = Center( // размещаем текст по центру
  child: text
);

Container container = Container( // Для Container свойство color означает цвет фона
  color: Color.fromARGB(255, numbers[3], numbers[4], numbers[5]),
  child: center
);

main() => runApp(
  Directionality(
    textDirection: TextDirection.ltr, // направление текста
    child: GestureDetector( // используется как обычный виджет

      onTap: () { // одно из свойств GestureDetector

        var numbers = getSixRandomNumbers();

        textStyle = TextStyle( //  виджет для изменения текста
          color: Color.fromARGB(255, numbers[0], numbers[1], numbers[2]), //  цвет текста random
          fontSize: 45.0, //  размер шрифта
          fontStyle: FontStyle.italic
        );

        text = Text( // отрисовывает текст
            'Hey there', // текст
            style: textStyle
        );

        center = Center( // размещаем текст по центру
            child: text
        );

        container = Container( // Для Container свойство color означает цвет фона
            color: Color.fromARGB(255, numbers[3], numbers[4], numbers[5]), // устанавливаем цвет background random
            child: center
        );

        main(); // запускаем приложение заново (это наверное не очень хорошо)
      },

      child: container,
    ),
  ),
);
