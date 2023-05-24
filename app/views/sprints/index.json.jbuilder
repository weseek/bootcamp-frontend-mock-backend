json.array! @sprints do |sprint|
  json.extract! sprint, :id, :name, :start_at, :end_at, :is_archived, :created_at, :updated_at
  json.swimlanes do
    json.array! sprint.swimlanes, partial: 'swimlanes/swimlane', as: :swimlane
  end
end
