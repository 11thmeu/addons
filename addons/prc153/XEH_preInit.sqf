#include "script_component.hpp"

ADDON = false;

// Main Functions
PREP(dialogUpdate);
PREP(dialogResetLCD);
PREP(dialogStart);
PREP(getActMenu);
PREP(setActMenu);
PREP(initRadioSettings);

// Input Functions
PREP(inputButton0);
PREP(inputButton1);
PREP(inputButton2);
PREP(inputButton3);
PREP(inputButton4);
PREP(inputButton5);
PREP(inputButton6);
PREP(inputButton7);
PREP(inputButton8);
PREP(inputButton9);
PREP(inputButtonDash);
PREP(inputButtonAsterisk);
PREP(inputButtonAct1);
PREP(inputButtonAct2);
PREP(inputButtonAct3);
PREP(inputButtonArrowDown);
PREP(inputButtonArrowUp);
PREP(inputButtonArrowLeft);
PREP(inputButtonArrowRight);
PREP(inputButtonArrowLeft);
PREP(inputButtonCenter);
PREP(inputButtonHome);
PREP(inputButtonLaptop);
PREP(inputKnobVolume);
PREP(inputKnobChannel);
PREP(inputConnector);
PREP(inputButtonPTT);

// Helpers
PREP(playSoundButton);
PREP(playSoundConnector);
PREP(playSoundKnob);

ADDON = true;