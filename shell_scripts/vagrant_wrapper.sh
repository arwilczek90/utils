#!/bin/zsh

D=$(date +%d.%m.%y-%H:%M:%S)

if [ "$1" = "up" ]; then
    if [ -z "$2" ]; then
        echo "bringing up all boxes"
        cd "$PROJECT_DIR/LocalEmma"
        vagrant up | tee "$LOG_DIR/both_provisions_$D.log"

    elif [ "$2" = "emma27" ]; then
        echo "Bringing up emma27"
        cd "{$PROJECT_DIR}/LocalEmma"
        vagrant up emma27 | tee "$LOG_DIR/emma27_$D.log"

    elif [ "$2" = "audience" ]; then
        echo "Bringing up audience"
        cd "$PROJECT_DIR/LocalEmma"
        vagrant up audience | tee "$LOG_DIR/audience_$D.log"
    elif [ "$2" = "bases" ]; then
        echo "Bringing up both baseboxes"
        set LOCALEMMA_BASE_ONLY=True
        cd "$PROJECT_DIR/LocalEmma"

        vagrant up &> "$LOG_DIR/both_basebox_provisions_$D.log"
        unset LOCALEMMA_BASE_ONLY

    elif [ "$2" = "emmabase" ]; then
        echo "Bringing up emmabase"
        set LOCALEMMA_BASE_ONLY=True
        cd "$PROJECT_DIR/LocalEmma"
        vagrant up emmabase | tee "$LOG_DIR/emmabase_$D.log"
        unset LOCALEMMA_BASE_ONLY

    elif [ "$2"  = "audiencebase" ]; then
        echo "Bringing up audiencebase"
        set LOCALEMMA_BASE_ONLY=True
        cd "$PROJECT_DIR/LocalEmma"
        vagrant up audiencebase | tee "$LOG_DIR/audiencebase_$D.log"
        unset LOCALEMMA_BASE_ONLY
    else
        echo "Unknown Command"
    fi


    elif [ "$1" = "destroy" ]; then
        if [ -z "$2" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy --force

        elif [ "$2" = "emma27" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy emma27 --force

        elif [ "$2" = "emma27" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy emma27 --force

        elif [ "$2" = "bases" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            set LOCALEMMA_BASE_ONLY=True
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy --force
            unset LOCALEMMA_BASE_ONLY

        elif [ "$2" = "emmabase" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            set LOCALEMMA_BASE_ONLY=True
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy emmabase --force
            unset LOCALEMMA_BASE_ONLY

        elif [ "$2" = "audiencebase" ]; then
            echo "MALTOC THE DESTROYER HAS COME TO CLEANSE THE FILTH FROM THIS EARTH!!!"
            set LOCALEMMA_BASE_ONLY=True
            cd "$PROJECT_DIR/LocalEmma"
            vagrant destroy audiencebase --force
            unset LOCALEMMA_BASE_ONLY

        else
            echo "Unknown Command"
        fi
fi

