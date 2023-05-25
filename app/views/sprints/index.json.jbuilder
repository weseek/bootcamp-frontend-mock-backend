json.array! @sprints do |sprint|
  json.partial! sprint
  json.swimlanes do
    json.array! sprint.swimlanes, partial: 'swimlanes/swimlane', as: :swimlane
  end
end
