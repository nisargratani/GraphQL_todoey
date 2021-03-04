import 'package:app_boilerplate/components/custom_button.dart';
import 'package:app_boilerplate/components/feed_tile.dart';
import 'package:app_boilerplate/data/feed_list.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  static int _lastLatestFeedId;
  static int _oldestFeedId;
  static int _newTodoCount = 0;
  static int _previousId = 0;
  static int _newId = 0;
  GraphQLClient _client;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _client = GraphQLProvider.of(context).value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("All tab");
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Say something ...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  width: 90,
                  height: 50,
                  onTap: () {
                    feedList.addFeed("", "You", _controller.text);
                    _controller.clear();
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  text: "Post",
                ),
              )
            ],
          ),
        ),
        CustomButton(
          onTap: () {
            print("loading");
          },
          height: 50,
          text: "New Notification",
          width: MediaQuery.of(context).size.width / 2,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: feedList.list.length,
            itemBuilder: (context, index) {
              return FeedTile(
                  username:
                      feedList.list[feedList.list.length - index - 1].username,
                  feed: feedList.list[feedList.list.length - index - 1].feed);
            },
          ),
        ),
        CustomButton(
          onTap: () {
            print("load more");
          },
          height: 50,
          text: "Load More",
          width: MediaQuery.of(context).size.width / 3,
        )
      ],
    );
  }
}
