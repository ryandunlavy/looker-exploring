view: liquid_madness {

  derived_table: {
    sql:
      {% assign var =  _filters['liquid_madness.param'] %}
      {% assign vartwo = _filters['liquid_madness.paramtwo'] %}
          {% if var == "country" %}
        select country as field1, NULL as field2, NULL as field3 from users
        {% elsif var == "state" %}
        select state as field1, NULL as field2, NULL as field3 from users
        {% elsif var == "ALL" %}
        select country as field1, state as field2, id as field3  from users
        {% elsif var == "id" %}
        select id as field1, NULL as field2, NULL as field3 from users
        {% endif %}
      ;;
  }

  dimension: field1 {
    label: "{% assign var =  _filters['liquid_madness.param'] %} {% if var == 'ALL' %} country {% else %} {{ var }} {% endif %}"
  }

  dimension: field2 {
    label: "{% assign var =  _filters['liquid_madness.param'] %} {% if var == 'ALL' %} state {% else %} NULL {% endif %}"
  }

  dimension: field3 {
    label: "{% assign var =  _filters['liquid_madness.param'] %} {% if var == 'ALL' %} id {% else %} NULL {% endif %}"
  }
  parameter: param {
    type: string
    allowed_value: {
      label: "country"
      value: "country"
    }
    allowed_value: {
      label: "state"
      value: "state"
    }
    allowed_value: {
      label: "All"
      value: "ALL"
    }
  }



}
