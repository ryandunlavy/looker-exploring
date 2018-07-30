view: daily_seeding {
  derived_table: {
    sql: SELECT TEAM_NAME, conference, date, MAX(WINS) AS wins, MAX(losses) AS losses, RANK() OVER (PARTITION BY DATE, CONFERENCE ORDER BY MAX(WINS)/NULLIF(MAX(LOSSES),0) DESC) AS rank  FROM (SELECT *,
          SUM(CASE WHEN won THEN 1 ELSE 0 END) OVER (PARTITION BY TEAM_NAME ORDER BY date) AS wins,
          SUM(CASE WHEN NOT won THEN 1 ELSE 0 END) OVER (PARTITION BY TEAM_NAME ORDER BY date) AS losses
          FROM
      (SELECT CAST(dates.date AS DATE) as date,
              games.TEAM_NAME,
              CASE WHEN games.TEAM_NAME IN ("Clippers",
                                          "Grizzlies",
                                          "Jazz",
                                          "Kings",
                                          "Lakers",
                                          "Mavericks",
                                          "Nuggets",
                                          "Pelicans",
                                          "Rockets",
                                          "Spurs",
                                          "Suns",
                                          "Thunder",
                                          "Timberwolves",
                                          "Trail Blazers",
                                          "Warriors") THEN "Western"
                    ELSE "Eastern"
                    END AS conference,
              (games.PLUS_MINUS > 0) as won
              FROM
        (SELECT * FROM (SELECT TEAM_NAME FROM team_data GROUP BY 1)
        FULL JOIN (SELECT date FROM game_list GROUP BY 1) ON 1=1) dates
        LEFT JOIN (SELECT * FROM game_list g LEFT JOIN team_data t ON g.gameIds=t.GAME_ID) games
        ON games.date=dates.date AND games.TEAM_NAME=dates.TEAM_NAME
      ORDER BY TEAM_NAME, date) games)
      WHERE TEAM_NAME IS NOT NULL
      GROUP BY DATE, TEAM_NAME, conference
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.TEAM_NAME ;;
  }

  dimension: conference {
    type: string
    sql: ${TABLE}.conference ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: wins {
    type: number
    sql: ${TABLE}.wins ;;
  }

  dimension: losses {
    type: number
    sql: ${TABLE}.losses ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  set: detail {
    fields: [
      team_name,
      conference,
      date,
      wins,
      losses,
      rank
    ]
  }
}
