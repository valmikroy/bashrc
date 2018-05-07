function _hex2dec {
        echo "ibase=16;$1" | bc
}

function _dec2hex {
        echo "obase=16;$1" | bc
}
