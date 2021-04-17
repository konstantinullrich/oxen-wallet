import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oxen_wallet/generated/l10n.dart';
import 'package:oxen_wallet/palette.dart';
import 'package:oxen_wallet/routes.dart';
import 'package:oxen_wallet/src/screens/base_page.dart';
import 'package:oxen_wallet/src/screens/nodes/node_indicator.dart';
import 'package:oxen_wallet/src/stores/node_list/node_list_store.dart';
import 'package:oxen_wallet/src/stores/settings/settings_store.dart';
import 'package:oxen_wallet/src/widgets/oxen_dialog.dart';
import 'package:provider/provider.dart';

class NodeListPage extends BasePage {
  NodeListPage();

  @override
  String get title => S.current.nodes;

  @override
  Widget trailing(context) {
    final nodeList = Provider.of<NodeListStore>(context);
    final settings = Provider.of<SettingsStore>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonTheme(
          minWidth: double.minPositive,
          child: TextButton(
              onPressed: () async {
                await showConfirmOxenDialog(
                    context,
                    S.of(context).node_reset_settings_title,
                    S.of(context).nodes_list_reset_to_default_message,
                    onFutureConfirm: (context) async {
                  Navigator.pop(context);
                  await nodeList.reset();
                  await settings.setCurrentNodeToDefault();
                  return true;
                });
              },
              child: Text(
                S.of(context).reset,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).primaryTextTheme.subtitle2.color),
              )),
        ),
        Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).selectedRowColor),
            child: IconButton(
              iconSize: 22,
              padding: EdgeInsets.zero,
              onPressed: () async =>
                  await Navigator.of(context).pushNamed(Routes.newNode),
              icon: Icon(Icons.add, color: OxenPalette.teal, size: 22.0),
            )),
      ],
    );
  }

  @override
  Widget body(context) => NodeListPageBody();
}

class NodeListPageBody extends StatefulWidget {
  @override
  NodeListPageBodyState createState() => NodeListPageBodyState();
}

class NodeListPageBodyState extends State<NodeListPageBody> {
  @override
  Widget build(BuildContext context) {
    final nodeList = Provider.of<NodeListStore>(context);
    final settings = Provider.of<SettingsStore>(context);

    final currentColor = Theme.of(context).selectedRowColor;
    final notCurrentColor = Theme.of(context).backgroundColor;

    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: <Widget>[
          Expanded(child: Observer(builder: (context) {
            return ListView.separated(
                separatorBuilder: (_, __) => Divider(
                    color: Theme.of(context).dividerTheme.color, height: 1),
                itemCount: nodeList.nodes.length,
                itemBuilder: (BuildContext context, int index) {
                  final node = nodeList.nodes[index];

                  return Observer(builder: (_) {
                    final isCurrent = settings.node == null
                        ? false
                        : node.key == settings.node.key;

                    final content = Container(
                        color: isCurrent ? currentColor : notCurrentColor,
                        child: ListTile(
                          title: Text(
                            node.uri,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6
                                    .color),
                          ),
                          trailing: FutureBuilder(
                              future: nodeList.isNodeOnline(node),
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.done:
                                    return NodeIndicator(
                                        active: snapshot.data as bool);
                                  default:
                                    return NodeIndicator();
                                }
                              }),
                          onTap: () async {
                            if (!isCurrent) {
                              await showSimpleOxenDialog(context, '',
                                  S.of(context).change_current_node(node.uri),
                                  onPressed: (context) async {
                                Navigator.of(context).pop();
                                await settings.setCurrentNode(node: node);
                              });
                            }
                          },
                        ));

                    return isCurrent
                        ? content
                        : Dismissible(
                            key: Key('${node.key}'),
                            confirmDismiss: (direction) async {
                              var result = false;
                              await showConfirmOxenDialog(
                                  context,
                                  S.of(context).remove_node,
                                  S.of(context).remove_node_message,
                                  onDismiss: (context) =>
                                      Navigator.pop(context, false),
                                  onConfirm: (context) {
                                    result = true;
                                    Navigator.pop(context, true);
                                    return true;
                                  });
                              return result;
                            },
                            onDismissed: (direction) async =>
                                await nodeList.remove(node: node),
                            direction: DismissDirection.endToStart,
                            background: Container(
                                padding: EdgeInsets.only(right: 10.0),
                                alignment: AlignmentDirectional.centerEnd,
                                color: OxenPalette.red,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      S.of(context).delete,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                            child: content);
                  });
                });
          }))
        ],
      ),
    );
  }
}
