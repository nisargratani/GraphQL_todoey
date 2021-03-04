/*

static String fetchNewNotification = """subscription fetchNewNotification {
  todos(where: {is_public: {_eq: true}}, limit: 1, order_by: {created_at: desc}) {
    id
  }
}
""";

 static String addPublicTodo = """mutation (\$title: String!){
    insert_todos (
      objects: [{
        title: \$title,
        is_public: true
      }]
    ){
      returning {
        id
      }
    }
  }""";

  */
