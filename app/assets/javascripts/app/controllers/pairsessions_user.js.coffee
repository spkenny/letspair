window.letspair.application.controller 'PairsessionsUserCtrl', 
['$scope', 'DPCalendar', 'serverPairsessions', '$log',
($scope, DPCalendar, serverPairsessions, $log) ->
  $scope.sessions = []

  $scope.loadDaySessions = ->
    currentDate = DPCalendar.getCurrentDate()

    sessions = serverPairsessions.getEventsForUser($scope.userId, currentDate)
    sessions.then(
      (data) ->
        $scope.sessions = data
      (status) ->
        $log.error "can not load sessions for #{currentDate} #{status}"
    )
]