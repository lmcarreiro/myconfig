function dcu
    if count $argv >/dev/null
        docker compose up --force-recreate -d $argv
    else
        docker compose up --force-recreate -d
    end
end
