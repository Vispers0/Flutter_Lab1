import 'package:flutter/material.dart';
import 'color.dart';
import 'list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
  with SingleTickerProviderStateMixin {

  late TabController tabController;

  final testColor1 = const Color(0xFF068441);

  final List<ListItem> _items = [
    ListItem(
        leading: Image(image: AssetImage("assets/images/ic_36_speedometer.png")),
        title: "Изменить суточный лимит",
        subtitle: "На платежи и переводы",
        trailing: Icon(Icons.arrow_forward_ios_sharp)
    ),
    ListItem(
        leading: Image(image: AssetImage("assets/images/ic_36_percent.png")),
        title: "Переводы без комиссии",
        subtitle: "Показать остаток в этом месяце",
        trailing: Icon(Icons.arrow_forward_ios_sharp)
    ),
    ListItem(
        leading: Image(image: AssetImage("assets/images/ic_36_arrows_forward_back.png")),
        title: "Информация о тарифах и лимитах",
        subtitle: " ",
        trailing: Icon(Icons.arrow_forward_ios_sharp)
    ),
  ];

  @override
  void initState(){
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.close, color: AppColors.icons_top,),
                    iconSize: 24.0),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.logout, color: AppColors.icons_top),
                    iconSize: 24.0)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child:
                      const Image(image: AssetImage("assets/images/photo.png"),
                        width: 110,
                        height: 110,
                      ),
                  )
                ],
              ),
              const SizedBox(height: 36,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Екатерина",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              Expanded(
                child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 14, 0, 0),
                    child: Scaffold(
                      appBar: TabBar(
                        controller: tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: testColor1,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black.withAlpha(140),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs:const [
                          Tab(text: "Профиль",),
                          Tab(text: "Настройки",)
                        ]
                      ),
                      body: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              const SizedBox(height: 30,),
                              const Text(
                                "У вас подключено",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                "Подписки, автоплатежи и сервисы на которые вы подписались",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withAlpha(140)
                                ),
                              ),
                              const SizedBox(height: 20,),
                              SizedBox(
                                height: 130,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      width: 216,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 5,
                                            offset: const Offset(0,0)
                                        )],
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                            child: Row(
                                              children: [
                                                Image(image: AssetImage("assets/images/logo.png"),
                                                ),
                                                SizedBox(width: 12,),
                                                Text("СберПрайм",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 18,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text("Платёж 9 июля",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text("199 ₽ в месяц",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: Colors.black.withOpacity(0.55),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8,),
                                    Container(
                                      margin: const EdgeInsets.all(5),
                                      width: 216,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 0.5,
                                            blurRadius: 5,
                                            offset: const Offset(0,0)
                                        )],
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                            child: Row(
                                              children: [
                                                Image(image: AssetImage("assets/images/percent.png"),
                                                ),
                                                SizedBox(width: 12,),
                                                Text("Переводы",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 18,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text("Автопродление 21 августа",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      Text("199 ₽ в месяц",
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: Colors.black.withOpacity(0.55),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 34,),
                              const Text(
                                "Тарифы и лимиты",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Text(
                                "Для операций в Сбербанк Онлайн",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withAlpha(140)
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: _items.length,
                                  itemBuilder: (_, index){
                                    return Column(
                                      children: [ListTile(
                                        leading: _items[index].leading,
                                        title: Text(_items[index].title),
                                        titleTextStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                        ),
                                        subtitle: Text(_items[index].subtitle),
                                        subtitleTextStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.55)
                                        ),
                                        trailing: _items[index].trailing,
                                      ),
                                    ]
                                    );
                                  },
                                )
                              )
                            ]
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "В разработке",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
