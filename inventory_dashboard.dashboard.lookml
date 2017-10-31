- dashboard: activewear_inventory
  title: Activewear Inventory
  layout: newspaper
  elements:
  - title: Inventory Items by Department
    name: Inventory Items by Department
    model: ryans_model
    explore: inventory_items
    type: looker_column
    fields:
    - inventory_items.count
    - products.department
    - inventory_items.currently_stocked
    pivots:
    - inventory_items.currently_stocked
    fill_fields:
    - inventory_items.currently_stocked
    filters:
      products.category: Active
    sorts:
    - inventory_items.count desc 0
    - inventory_items.currently_stocked
    limit: 500
    column_limit: 50
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_series: []
    series_labels:
      No - inventory_items.count: Sold
      Yes - inventory_items.count: In Stock
    row: 0
    col: 0
    width: 14
    height: 7
  - title: Item Status
    name: Item Status
    model: ryans_model
    explore: inventory_items
    type: looker_column
    fields:
    - inventory_items.status
    - inventory_items.count
    pivots:
    - inventory_items.status
    fill_fields:
    - inventory_items.status
    filters:
      products.category: Active
    sorts:
    - inventory_items.status
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_series: []
    x_axis_label: Department
    series_labels:
      No - inventory_items.count: Sold
      Yes - inventory_items.count: In Stock
    row: 7
    col: 0
    width: 24
    height: 9
  - title: Activewear return rate
    name: Activewear return rate
    model: ryans_model
    explore: inventory_items
    type: single_value
    fields:
    - order_items.return_rate
    filters:
      products.category: Active
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    value_labels: legend
    label_type: labPer
    series_types: {}
    hidden_series: []
    x_axis_label: Department
    series_labels:
      No - inventory_items.count: Sold
      Yes - inventory_items.count: In Stock
    row: 0
    col: 14
    width: 10
    height: 7
