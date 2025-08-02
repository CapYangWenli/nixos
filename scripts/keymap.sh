hyprctl devices | awk '
BEGIN { RS="Keyboard at "; FS="\n" }
/cherry-cherry-usb-keyboard/ {
    for (i = 1; i <= NF; i++) {
        if ($i ~ /active keymap:/) {
            if ($i ~ /Russian/) {
                print "ru"
            } else if ($i ~ /English \(US\)/) {
                print "en"
            } else {
                print "unknown"
            }
            exit
        }
    }
}
'
