#!/bin/bash
cmd=(dialog --keep-tite --menu "Welcome to Ernie's Utility Menu v2.0:" 22 76 16)

options=(1  "Hide Connection"
         2  "Disconnect from VPN"
         3  "Status of Connection"
         4  "Update the system"
         5  "Clean up post update mess" 
         6  "Deep Clean (Trojans and malware)"
         7  "Speedometer (Bandwith Monitor)"
         8  "Bmon (Bandwith Monitor)"
         9  "Test Bandwith speed (up & down)"
         10 "Download a video"
         11 "Snow in the terminal"
        )
                
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices 
    do    
        case $choice in
        1)
            expressvpn connect
            ;;
        2)
            expressvpn disconnect
            ;;
        3)
            expressvpn status && nmcli dev wifi
            ;;
        4)
            sudo apt update && sudo apt upgrade -y #!//&& sudo apt-get dist-upgrade -y not sure if I want to do this part....
            ;;
        5)
            sudo apt update && sudo apt -f install && sudo dpkg --configure -a && sudo apt clean && sudo apt autoremove && sudo -k
            ;;
        6)
            sudo chkrootkit -d && sudo rkhunter -c --rwo && sudo -k
            ;;
        7)
            speedometer -l  -r wlp2s0 -t lo -m $(( 1024 * 1024 * 3 / 2 ))
            ;;
        8)
            bmon
            ;;
        9)
            speedtest
            ;;
        10)
            echo "Imput the link, please!"
            read imputvar
            youtube-dl $imputvar
            ;;
        11)
            ./snow.sh
            ;;
        esac
read -p "Hit enter to continue ..."
clear
exec /bin/bash "$0" "$@"
      done


