;
;                _       _                                         _____   _
;        /\     | |     | |                                       / ____| | |
;       /  \    | |_    | |        __ _   _   _    ___   _ __    | |      | |__     __ _   _ __     __ _    ___
;      / /\ \   | __|   | |       / _` | | | | |  / _ \ | '__|   | |      | '_ \   / _` | | '_ \   / _` |  / _ \
;     / ____ \  | |_    | |____  | (_| | | |_| | |  __/ | |      | |____  | | | | | (_| | | | | | | (_| | |  __/
;    /_/    \_\  \__|   |______|  \__,_|  \__, |  \___| |_|       \_____| |_| |_|  \__,_| |_| |_|  \__, |  \___|
;                                          __/ |                                                    __/ |
;                                         |___/                                                    |___/
;
; This is executed when inserted between layers using a post processing script in Cura.
;
; To use:
; + In Cura, add the "Insert at layer change" post processing script.
; + Use these settings:
;   - When to insert = before
;   - G-Code to insert = M98 P"Commands/LayerChange/AtLayerChange.g"
;
