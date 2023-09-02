import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentals_app/src/features/default_home/model/dashbaord_model.dart';
import 'package:rentals_app/src/features/default_home/provider/home_provider.dart';
import '../../../constants/colors.dart';

class DashoardUi extends ConsumerStatefulWidget {
  const DashoardUi(
    this.userUid, {
    super.key,
  });

  final String userUid;

  @override
  ConsumerState<DashoardUi> createState() => _DashoardUiState();
}

class _DashoardUiState extends ConsumerState<DashoardUi> {
  @override
  Widget build(BuildContext context) {
    final statement = ref.watch(useDashbaord(widget.userUid));
    return statement.when(
        data: (dashboard) => DashboardElments(dashboardModel: dashboard),
        error: (err, msg) => Text("Err $err"),
        loading: () => const Text("Building Your dashbaord"));
  }
}

class DashboardElments extends StatelessWidget {
  const DashboardElments({
    super.key,
    required this.dashboardModel,
  });

  final DashboardModel dashboardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Welcome back",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(dashboardModel.statement
                            .getTenantInfomationProp('full_name'))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          "Chic Join bar",
                          style: TextStyle(color: tPrimaryColor),
                        ),
                        Text("Mutall Business Center")
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [tPrimaryShade, tShadeToColor]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                      topRight: Radius.circular(64)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(8, 8),
                        blurRadius: 16,
                        color: tShadowColor)
                  ]),
              child: Container(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Current Balance",
                      style: TextStyle(fontSize: 24, color: tWhiteColor),
                    ),
                    Text(
                      dashboardModel.statement.getAccountBalance(),
                      style: const TextStyle(fontSize: 32, color: textColor),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Due Date",
                          style: TextStyle(
                              fontSize: 8,
                              letterSpacing: .7,
                              color: tWhiteColor),
                        ),
                        Expanded(child: Container()),
                        const Text(
                          "2023-06-23",
                          style: TextStyle(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    const Text(
                      "Account Status",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.square_foot_outlined,
                            ),
                            Text(
                              "Maintained",
                              style: TextStyle(color: tPrimaryColor),
                            )
                          ],
                        ),
                        const Divider(color: Colors.grey)
                      ],
                    )
                  ],
                )),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const Text(
                    "Utilities",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text("Water Reading"),
                        Text(
                          "2567",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ]),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text("Power Reading"),
                        Text(
                          "2567",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ]),
                ]),
              ),
            )
          ],
        ));
  }
}
