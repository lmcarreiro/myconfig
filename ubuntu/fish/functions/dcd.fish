function dcd
    if count $argv >/dev/null
        docker compose rm -sf $argv
    else
        docker compose down
    end
end
