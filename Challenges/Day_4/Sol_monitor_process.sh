#!/bin/bash

# Check if the specified process is running


is_the_process_running() {
        if pgrep -x "$1" >/dev/null; then
                return 0
        else
                return 1
        fi
}

# Check the status of the process and restart if its stopped
restart_process() {
        local process_name="$1"

        echo "process $process_name has stopped. need to restart the process"

        if sudo systemctl restart "$process_name"; then
                echo "Process $process_name has restarted successfully."
        else
                echo "Failed to restart the process $process_name. Please restart manually"
        fi
}



process_name=$1
max_attempts=3
attempt=1

while [ $attempt -le $max_attempts ];
do
        if is_the_process_running "$process_name"; then
                echo "process $process_name is running."
                break
        else
                restart_process "$process_name"
        fi

        attempt=$((attempt + 1))
        sleep 5         # wait for 5 min before next check
done



echo "maximum attempts reached. please check the process manually"