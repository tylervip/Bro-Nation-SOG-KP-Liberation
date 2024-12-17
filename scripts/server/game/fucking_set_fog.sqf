while {true} do { 
    if (daytime >= 19 && daytime < 19.1) then { 
        0 setOvercast 0;
        5 setFog [0, 0, 0];
        forceWeatherChange;
    };
    sleep 60;
};
