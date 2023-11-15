state("LUNACID") {
    string255 levelId : "UnityPlayer.dll", 0x0197A840, 0x20, 0x10, 0xC;
}

startup {
    vars.FIRST_LEVEL = "s/PITT_A1.unity";
    vars.CHAR_CREATOR = "s/CHAR_CREATE.unity";
    vars.ENDINGS = new string[5]{
        "s/END_A.unity",
        "s/END_B.unity",
        "s/END_TOWN.unity",
        "s/END_EVID.unity",
        "s/END_E.unity",
    };
    vars.IsEnding = (Func<string, bool>)((string levelId) => {
        foreach (string ending in vars.ENDINGS) {
            if (ending == levelId) {
                return true;
            }
        }
        return false;
    });
}

update {
    print("current level is " + current.levelId);
}

start {
    if (current.levelId == vars.FIRST_LEVEL && old.levelId == vars.CHAR_CREATOR) {
        return true;
    }
}

split {
    // split when getting an ending 
    if (current.levelId != old.levelId && vars.IsEnding(current.levelId)){
        return true;
    }
}
