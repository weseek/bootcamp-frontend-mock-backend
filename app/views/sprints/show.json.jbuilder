json.partial! "sprints/sprint", sprint: @sprint
# add "swimlanes"/"tasks" fields in response body, only when rendering show response
if action_name == "show"
  json.swimlanes do
    json.array! @sprint.swimlanes do |swimlane|
      json.partial! swimlane
      json.tasks do
        json.array! swimlane.tasks, partial: 'tasks/task', as: :task
      end
    end
  end
end
