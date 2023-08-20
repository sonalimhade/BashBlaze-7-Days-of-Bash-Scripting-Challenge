#!/bin/bash

#part 1

function create_user {
        read -p "please enter username:" username

        # check if user already exists

        if id "$username" &>/dev/null; then
               echo "Error: The username '$username' already exists. Please choose another username"
        else
                # prompt for password
                read -p "please enter password for $username:" password

                # create user account
                sudo useradd -m -p "$password" "$username"
                echo "'$username' account created successfully"
        fi
}

#part2

function delete_user {

        # read the name of the user you want to delete

        read -p "Enter the name of the user you want to delete." username

        if id "$username" &>/dev/null; then
                sudo userdel -r "$username"
                echo "user '$username' deleted successfully"
        else
                echo "Error: User '$username'  does not exists"
        fi
}

#Part 3 Password reset

function reset_user {

        # reset the password of the user 

        read -p "Enter the name of the user whose password you want to reset:" username

        if id "$username" &>/dev/null; then
                read -p "Enter the new password for '$username':" password
                echo sudo "$username:$password" | chpasswd
                echo "Password for '$username' has been changed successfully"
        else
                echo "Error: '$username' for whom you are trying to reset password does not exist."
        fi
}


#part 3: List all users with their Id's

function list_user {
        echo "Following is the list of all users"
        sudo cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

#part 5: help
function_usage {
        echo "Usage: $0 [OPTIONS]"
        echo "Options:"
        echo "  -c, --create     Create a new user account."
        echo "  -d, --delete     Delete an existing user account."
        echo "  -r, --reset      Reset password for an existing user account."
        echo "  -l, --list       List all user accounts on the system."
        echo "  -h, --help       Display this help and exit."
}


if [ $# -eq 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        usage
        exit 0
fi






while [ $# -gt 0 ]; do
        case "$1" in
                -c|--create)
                        create_user
                        ;;
                -d|--delete)
                        delete_user
                        ;;
                -r|--reset)
                        reset_user
                        ;;
                -l|--list)
                        list_user
                        ;;
                *)
                        echo "'$1' no such option available. enter -h or --help to explore more options"
                        exit 1
                        ;;
        esac
        shift
done