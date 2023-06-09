/*
	Remove certain objects globally when the server starts up.
	205s, (3 mins 25 seconds), 191316 objects hidden.
	Too much, put on clientside
*/

systemChat format ["Start Time: %1", serverTime];
private _time = serverTime;

private _list = nearestObjects [ [15000,15000,0] , [], 20000];
private _count = 0;
{
	_stringInterpretation = str _x;
	_obj = _x;
	{
		if (_x in _stringInterpretation) then {
			hideObjectGlobal _obj;
			_count = _count + 1;
		};
	} forEach ["b_ficusc2d_f.p3d", "wired_fence_8m_f.p3d", "wired_fence_4m_f.p3d", "wired_fence_8md_f.p3d","powerpolewooden_small_f.p3d","powerpolewooden_f.p3d"];
																																																					
	if ( (typeOf _x) in ["Land_HighVoltageColumn_F", "Land_HighVoltageColumnWire_F", "Land_HighVoltageTower_large_F", "Land_PowerWireBig_direct_F","Land_PowerWireBig_direct_short_f","Land_PowerWireBig_end_F", "Land_PowerWireBig_direct_short_F", "Land_HighVoltageTower_largeCorner_F", "Land_PowerWireBig_right_F", "Land_PowerWireBig_left_F"] ) then { 
    	hideObjectGlobal _x; 
		_count = _count + 1;
	};

} forEach _list;

/* 

I'm guessing removing this field of reflective obejcts might result in FPS improvements.
Feels hacky to do this, but if FPS is ++ enough, I'm not against it.

"Land_spp_Mirror_F", "mil_wiredfence_f.p3d", "mil_wiredfenced_f.p3d"
This is if we want to re-do MPP to be more infantry friendly.*/
/*{
	_strInterp = str _x;
	if ("mil_wiredfence_f.p3d" in _strInterp || "mil_wiredfenced_f.p3d" in _strInterp) then {
		hideObjectGlobal _x;
		_count = _count + 1;
	};
	if ( (typeOf _x) in ["Land_spp_Mirror_F"] ) then { 
    	hideObjectGlobal _x; 
		_count = _count + 1;
	};
} forEach _list;*/

systemChat format ["Elapsed Time: %1, objectsHidden: %2", serverTime-_time, _count];
