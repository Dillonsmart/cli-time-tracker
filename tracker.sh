#!/usr/bin/env bash

tasks_csv="${PWD}/tasks.csv"
action=$1

# Create tasks.csv if it doesn't exist
if [ ! -f "$tasks_csv" ]; then
	touch "$tasks_csv"
fi

case $action in
  add)
    task=$2
    # TODO Add additional column for datetime
    echo "$task" >> "$tasks_csv"
    echo "Task added: $task"
    ;;
  list)
    cat -n "$tasks_csv"
    ;;
  complete)
    task_number=$2
    task=$(sed -n "${task_number}p" "$tasks_csv")
    sed -i "${task_number}d" "$tasks_csv"
    echo "Task completed: $task"
    ;;
  *)
    echo "Invalid action: $action"
    ;;
esac
