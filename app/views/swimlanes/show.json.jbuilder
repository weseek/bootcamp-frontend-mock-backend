json.partial! "swimlanes/swimlane", swimlane: @swimlane
if action_name == "show"
  json.tasks do
    json.array! @swimlane.tasks, partial: 'tasks/task', as: :task
  end
end
