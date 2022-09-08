function kcontext
    if count $argv >/dev/null
        sudo wg-quick down (sudo wg show interfaces)
        sudo wg-quick up $argv
        k config use-context $argv
    else
        sudo wg show interfaces
        k config current-context
    end
end
