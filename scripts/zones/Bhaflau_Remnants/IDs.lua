-----------------------------------
-- Area: Bhaflau_Remnants
-----------------------------------
-----------------------------------

zones = zones or {}

zones[xi.zone.BHAFLAU_REMNANTS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        FULL_INVENTORY_AFTER_TRADE = 6386, -- You cannot obtain the <item>. Try trading again after sorting your inventory.
        ITEM_OBTAINED              = 6388, -- Obtained: <item>.
        GIL_OBTAINED               = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6391, -- Obtained key item: <keyitem>.
        KEYITEM_LOST               = 6392, -- Lost key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL        = 6393, -- You do not have enough gil.
        ITEMS_OBTAINED             = 6397, -- You obtain <number> <item>!
        CELL_OFFSET                = 7212, -- Main Weapon/Sub-Weapon restriction removed.
        TEMP_ITEM                  = 7233, -- Obtained temporary item: <item>.
        HAVE_TEMP_ITEM             = 7234, -- You already have that temporary item.
        SALVAGE_START              = 7235, -- You feel an incredible pressure bearing down on you. This area appears to be blanketed in some sort of intense psionic field...
        TIME_TO_COMPLETE           = 7407, -- You have <number> [minute/minutes] (Earth time) to complete this mission.
        MISSION_FAILED             = 7408, -- The mission has failed. Leaving area.
        TIME_REMAINING_MINUTES     = 7412, -- ime remaining: <number> [minute/minutes] (Earth time).
        TIME_REMAINING_SECONDS     = 7413, -- ime remaining: <number> [second/seconds] (Earth time).
        PARTY_FALLEN               = 7415, -- ll party members have fallen in battle. Mission failure in <number> [minute/minutes].
        DOOR_IS_SEALED             = 7426, -- The door is sealed...
        DOOR_IS_SEALED_MYSTERIOUS  = 7428, -- The door is sealed by some mysterious force...

    },
    mob =
    {
        [1] =
        {
            [1] =
            {
                STAGE_START =
                {
                    17084427, 17084428, 17084429, 17084430, 17084431, 17084432, 17084433, 17084434,
                    17084435, 17084436, 17084437, 17084438, 17084439, 17084440, 17084441, 17084442,
                    17084443, 17084444, 17084445, 17084446, 17084447, 17084448, 17084449
                },
            },
            [2] =
            {
                STAGE_START =
                {
                    17084450, 17084451, 17084452, 17084453, 17084454, 17084455, 17084456, 17084457,
                    17084458, 17084459, 17084460, 17084461, 17084462, 17084463, 17084464, 17084465,
                    17084466, 17084467, 17084468, 17084469, 17084470, 17084471, 17084472,
                },
            },
            [3] =
            {
                STAGE_START =
                {
                    17084473, 17084474, 17084478, 17084479, 17084480,
                },
            },
            [4] =
            {
                STAGE_START =
                {
                    17084473, 17084474, 17084475, 17084476, 17084477,
                },
            },
            MAD_BOMBER = 17084481,
            RAMPART    = 17084692,
        },
        [2] =
        {
            [0] =
            {
                STAGE_START = -- Center 4 Flans
                {
                    MAGICAL  = {17084482, 17084484},
                    PHYSICAL = {17084483, 17084485},
                },
            },
            [1] = -- East Route
            {
                STAGE_START =
                {
                    17084486, 17084487, 17084488, 17084489, 17084490, 17084491, 17084492, 17084493,
                    17084494, 17084495, 17084496, 17084497, 17084498, 17084499, 17084500,
                },
                NORTH_EAST =
                {
                    17084501, 17084502, 17084503, 17084504, 17084505,
                    17084506, 17084507, 17084508, 17084509, 17084510,
                },
                SOUTH_EAST =
                {
                    17084511, 17084512, 17084513, 17084514, 17084515,
                    17084516, 17084517, 17084518, 17084519, 17084520,
                },
            },
            [2] = -- West Route
            {
                STAGE_START =
                {
                    17084521, 17084522, 17084523, 17084524, 17084526, 17084528, 17084529, 17084530,
                    17084531, 17084532, 17084533, 17084534, 17084535, 17084536, 17084538,
                },
                NORTH_WEST =
                {
                    17084539, 17084541, 17084543, 17084544, 17084545,
                    17084546, 17084547, 17084548, 17084549, 17084550,
                },
                SOUTH_WEST =
                {
                    17084551, 17084552, 17084553, 17084554, 17084555,
                    17084557, 17084558, 17084559, 17084560, 17084561,
                },
            },
            RAMPART   = 17084699,
            FLUX_FLAN = 17084720,
        },
        [3] =
        {
            [1] =
            {
                STAGE_START =
                {
                    17084569, 17084570, 17084571, 17084572, 17084573, 17084575, 17084577,
                },
            },
            [2] =
            {
                STAGE_START =
                {
                    17084610, 17084611, 17084612, 17084613, 17084614, 17084615, 17084616,
                },
            },
            [3] =
            {
                STAGE_START =
                {
                    17084562, 17084563, 17084564, 17084565, 17084566, 17084567, 17084568,
                },
            },
            [4] =
            {
                STAGE_START =
                {
                    17084603, 17084604, 17084605, 17084606, 17084607, 17084608, 17084609,
                },
            },
            [5] = -- North Central
            {
                17084579, 17084580, 17084581, 17084582, 17084583, 17084585, 17084586, 17084587, 17084590, 17084591,
                17084592, 17084593, 17084594, 17084595, 17084597, 17084598, 17084599, 17084600, 17084602,
            },
            [6] = -- South Central
            {
                17084617, 17084618, 17084619, 17084620, 17084621, 17084622, 17084623, 17084624, 17084625, 17084626,
                17084627, 17084628, 17084629, 17084630, 17084631, 17084632, 17084633, 17084634, 17084635, 17084636,
            },
            [7] = -- Center
            {
                17084637, 17084638, 17084639, 17084640, 17084641, 17084642, 17084643, 17084644, 17084645,
                17084646, 17084647, 17084648, 17084649, 17084650, 17084651, 17084652, 17084653, 17084654,
            },
            RAMPART = 17084706,
            JALAWAA = 17084721,
        },
        [4] =
        {
            [1] = --west
            {
                STAGE_START =
                {
                    17084671, 17084672, 17084673, 17084674, 17084675, 17084676, 17084677, 17084678,
                    17084679, 17084680, 17084681, 17084682, 17084683, 17084684, 17084685, 17084686,
                },
            },
            [2] = --east
            {
                STAGE_START =
                {
                    17084655, 17084656, 17084657, 17084658, 17084659, 17084660, 17084661, 17084662,
                    17084663, 17084664, 17084665, 17084666, 17084667, 17084668, 17084669, 17084670,
                },
            },
            RAMPART = 17084713,
        },
        [5] =
        {
            [0] =
            {
                STAGE_START =
                {
                    CHARIOT = 17084687,
                },
            },
        },
    },
    npc =
    {
        [0] =
        {
            TEMP_ITEMS_BOX = {17084418, 17084419, 17084420, 17084421, 17084422, 17084423, 17084424, 17084425, 17084426},
        },
        [1] =
        {
            DORMANT       = 17084688,
            EAST_ENTRANCE = 17084890,
            WEST_ENTRANCE = 17084891,
            WEST_EXIT = { 17084892, 17084893, 17084894 },
            EAST_EXIT = { 17084895, 17084896, 17084897 },
            CENTER_ENTRANCE = { 17084898, 17084899 },
        },
        [2] =
        {
            DORMANT = 17084689,
            SOCKET  = 17084856,
            WEST_ENTRANCE  = 17084900, --_23b
            EAST_ENTRANCE  = 17084901, --_23c
            NW_ENTRANCE    = 17084902, --_23d
            SW_ENTRANCE    = 17084903, --_23e
            NE_ENTRANCE    = 17084904, --_23f
            SE_ENTRANCE    = 17084905, --_23g
            NW_EXIT        = 17084906, --_23h
            SW_EXIT        = 17084907, --_23i
            NE_EXIT        = 17084908, --_23j
            SE_EXIT        = 17084909, --_23k
        },
        [3] =
        {
            DORMANT = 17084690,
            SLOT  = 17084857,
            SOUTH_CENTRAL = 17084916, --_23s
            NORTH_CENTRAL = 17084917, --_23s
            WEST_EXIT = 17084911, --_23m
            EAST_EXIT = 17084914, --_23p
        },
        [4] =
        {
            DORMANT = 17084691,
            DOOR1 = 17084918, --_23t
            DOOR2 = 17084919, --_23u
        },
        [5] =
        {
            DOOR1 = 17084920, -- _23v
            DOOR2 = 17084922, -- _23x
        },
    },
    pos =
    {
        [1] =
        {
            [1] =
            {
                exit = { 420, 16, -291, 64 },
            },
            [2] =
            {
                enter = { -340, 0, -530, 0 },
                exit = { 259, 16, -290, 64 },
            },
        },
        [2] =
        {
            [0] =
            {
                enter = { -340, 0, -233, 180 },
                exit = { 308, -4, 260, 127 },
            },
        },
        [3] =
        {
            [5]=
            {
                enter = { -340, 0, -530 , 0 },
                exit = { -186, -4, -420, 128 },
            },
            [6] =
            {
                enter = { -340, 0, -233, 180 },
                exit = { -493, -4, -420, 0 },
            },
        },
        [4] =
        {
            [1] =
            {
                enter = { 420, 0, 114, 192 },
                exit = { 300, 0, 155, 58 },
            },
            [2] =
            {
                enter = { 420, 0, 114, 192 },
                exit = { 300, 0, 155, 58 },
            },
        },
    },
}

return zones[xi.zone.BHAFLAU_REMNANTS]