#{
  set text(font: "FreeSans")
  set table.hline(stroke: 2pt)

  let schema = yaml("openapi.yaml")
  let components = schema.components
  let display-schema(schema) = {
    let schema-type = schema.at("type", default: none)
    if schema-type != none {
      return schema-type
    }
    let schema-ref = schema.at("$ref", default: none)
    if schema-ref != none {
      let schema-name = schema-ref.trim("#/components/schemas/", at: start)
      return display-schema(components.schemas.at(schema-name))
    }
    panic("cant render schema")
  }

  table(
    columns: (auto, 1fr),
    ..schema
      .paths
      .pairs()
      .map(((path, endpoint)) => {
        endpoint.pairs().map(((method, operation)) => (path: path, method: method, operation: operation))
      })
      .flatten()
      .map(((path, method, operation)) => (
        table.hline(),
        [*#raw(upper(method))* *#raw(path)*],
        [],
        // table.header([*#raw(upper(method))* *#raw(path)*], []),
        [Beschreibung],
        operation.at("summary", default: ""),
        ..operation.parameters.map(parameter => (
          [Eingabe *#raw(parameter.name)* im _#raw(parameter.in)_],
          [#raw(display-schema(parameter.schema))],
        )),
        ..{
          let request-body = operation.at("requestBody", default: none)
          if request-body != none {
            let schema = request-body.content.at("application/json").schema
            (
              [Eingabe im _`body`_],
              [#raw(display-schema(schema))],
            )
          } else { () }
        },
        ..operation
          .responses
          .pairs()
          .map(((status, response)) => {
            let description = if status == 401 and response.description.len() == 0 {
              [Nicht authentifiziert]
            } else {
              response.description
            }
            let response-body = response.at("content", default: none)
            let schema = if response-body != none {
              let schema = response.content.at("application/json").schema
              [#raw(display-schema(schema))]
            } else {
              [_`void`_]
            }

            (
              [Ausgabe *#raw(status)*],
              [#schema],
            )
          }),
        table.hline(),
      ))
      .flatten()
  )
}
