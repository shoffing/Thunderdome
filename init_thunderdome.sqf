if (isServer) then {
    _center = getPosWorld center;

    /*
     * Create walls
     */
    _wallModel = "ca\roads2\dam\dam_conc\dam_conc_20.p3d";
    _wallLength = 19;
    _wallHalfHeight = 5;
    _wallRadius = 250;
    _wallAng = (360 * _wallLength) / (2 * pi * _wallRadius);
    for [{_d = 0}, {_d < 360}, {_d = _d + _wallAng}] do {
        _offset = [_wallRadius * sin _d, _wallRadius * cos _d, _wallHalfHeight];
        _pos = (_center vectorAdd _offset);
        _wall = createSimpleObject [_wallModel, _pos];
        _wall setDir _d;
    };

    /*
     * Create ramps
     */
    _rampRadiusTotal = 40;
    _rampHeightOffset = -2;

    _rampModel = "a3\structures_f\training\rampconcretehigh_f.p3d";
    _rampLength = 4;
    _rampHalfHeight = _rampHeightOffset + 1.5;
    _rampRadius = _rampRadiusTotal - 5;
    _rampAng = (360 * _rampLength) / (2 * pi * _rampRadius);
    for [{_d = 0}, {_d < 360}, {_d = _d + _rampAng}] do {
        _offset = [_rampRadius * sin _d, _rampRadius * cos _d, _rampHalfHeight];
        _pos = (_center vectorAdd _offset);
        _ramp = createSimpleObject [_rampModel, _pos];
        _ramp setDir _d;
    };

    _rampRadius = _rampRadiusTotal - 10;
    _rampAng = (360 * _rampLength) / (2 * pi * _rampRadius);
    for [{_d = 0}, {_d < 360}, {_d = _d + _rampAng}] do {
        _offset = [_rampRadius * sin _d, _rampRadius * cos _d, _rampHalfHeight];
        _pos = (_center vectorAdd _offset);
        _ramp = createSimpleObject [_rampModel, _pos];  
        _ramp setDir (_d + 180);
    };

    _rampModel = "a3\structures_f\training\rampconcrete_f.p3d";
    _rampHalfHeight = _rampHeightOffset - 0.25;
    _rampRadius = _rampRadiusTotal + 4;
    _rampAng = (360 * _rampLength) / (2 * pi * _rampRadius);
    for [{_d = 0}, {_d < 360}, {_d = _d + _rampAng}] do {
        _offset = [_rampRadius * sin _d, _rampRadius * cos _d, _rampHalfHeight];
        _pos = (_center vectorAdd _offset);
        _ramp = createSimpleObject [_rampModel, _pos];
        _ramp setDir _d;
    };

    _rampRadius = _rampRadiusTotal - 18;
    _rampAng = (360 * _rampLength) / (2 * pi * _rampRadius);
    for [{_d = 0}, {_d < 360}, {_d = _d + _rampAng}] do {
        _offset = [_rampRadius * sin _d, _rampRadius * cos _d, _rampHalfHeight];
        _pos = (_center vectorAdd _offset);
        _ramp = createSimpleObject [_rampModel, _pos];
        _ramp setDir (_d + 180);
    };

    /*
     * Create ramp lights
     */
    _lampClass = "Land_PortableLight_double_F";
    _lampRadius = _rampRadiusTotal - 7.5;
    _lampCount = 4;
    for [{_d = 0}, {_d < 360}, {_d = _d + (360 / _lampCount)}] do {
        _offset = [_lampRadius * sin _d, _lampRadius * cos _d, 2];
        _pos = (_center vectorAdd _offset);
        _lamp = _lampClass createVehicle _pos;
        _lamp setPosWorld _pos;
        _lamp setDir (_d + 180);
    };

    /*
     * Add vehicle armor, spare barrels
     */
    _trucks = allMissionObjects "LOP_AM_Offroad";
    {
        _x addMagazineCargo ["ACE_SpareBarrel", 50];

        // walls
        _w1 = "Land_Mil_ConcreteWall_F" createVehicle _center;
        _w1 attachTo [_x, [1, -1, -0.4]];
        _w1 setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

        _w2 = "Land_Mil_ConcreteWall_F" createVehicle _center;
        _w2 attachTo [_x, [-1, -1, -0.4]];
        _w2 setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

        // barbed wires
        _b1 = "land_chz_brevna_setka" createVehicle _center;
        _b1 attachTo [_x, [0.9, -1.75, 0]];
        _b1 setVectorDirAndUp [[1, 0, 0], [0, 0, 1]];

        _b2 = "land_chz_brevna_setka" createVehicle _center;
        _b2 attachTo [_x, [-0.9, -1.75, 0]];
        _b2 setVectorDirAndUp [[-1, 0, 0], [0, 0, 1]];

        // skull
        _s = "Land_HumanSkull_F" createVehicle _center;
        _s attachTo [_x, [0, 2.27, -0.13]];
        _s setVectorDirAndUp [[0, -1, 0], [0, 0, 1]];
    } forEach (_trucks);
};
